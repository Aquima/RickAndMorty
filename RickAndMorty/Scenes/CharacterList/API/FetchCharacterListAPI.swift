//
//  FetchCharacterListAPI.swift
//  RickAndMortyTests
//
//  Created by Raul Quispe  on 27/09/23.
//

import Foundation
import Combine

protocol CharacterListViewModelProtocol {
    func loadCharacters(_ name: String, _ handler: @escaping ([RyckAndMortyCharacter], PaginationState) -> Void)
}

final class FetchCharacterListAPI: CharacterListViewModelProtocol {

    private lazy var baseURL = URL(string: "https://rickandmortyapi.com/api/")!

    private var cancellable: Cancellable?
    private(set) var currentPage: Int = 1
    private(set) var prevName: String = ""
    private var previewCharacters: [RyckAndMortyCharacter] = []
    private lazy var httpClient: HTTPClient = {
        URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))
    }()
    private var reachability: ReachabilityCheckingProtocol

    init(_ reachability: ReachabilityCheckingProtocol = Reachability()) {
        self.reachability = reachability
    }

    func loadCharacters(_ name: String, _ handler: @escaping ([RyckAndMortyCharacter], PaginationState) -> Void) {
        if prevName != name {
            currentPage = 0
            previewCharacters.removeAll()
        }
        prevName = name
        guard reachability.isConnectedToNetwork()  else {
            handler(previewCharacters, .loadedAll)
            return
        }

        cancellable = makeRemoteCharacterLoader(currentPage, name).handleEvents(receiveCancel: {
            handler([], .noResults)
        })
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { [weak self] completion in
            guard let self = self else { return }
            switch completion {
            case .finished:
                break
            case let .failure(error):
                self.loadCharacters(name, handler)
                print(error.localizedDescription)
            }
        }, receiveValue: { [weak self] resource in
            guard let self = self else { return }
            self.currentPage += 1
            resource.forEach { self.previewCharacters.append($0) }
            handler(self.previewCharacters, .loadMore)
        })
    }

    private func makeRemoteCharacterLoader(
        _ page: Int = 1,
        _ name: String
    ) -> AnyPublisher<
        [RyckAndMortyCharacter],
        Error
    > {
        print("currentPage: \(currentPage)")
        let url = CharactersEndPoint.get(page: page, name: name).url(baseURL: baseURL)
        return httpClient
            .getPublisher(url: url)
            .tryMap(CharacterItemsMapper.map)
            .eraseToAnyPublisher()
    }
}
