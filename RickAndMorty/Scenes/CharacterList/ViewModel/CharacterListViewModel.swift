//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 26/09/23.
//

import Foundation
import Combine

final class CharacterListViewModel: ObservableObject {

    private lazy var baseURL = URL(string: "https://rickandmortyapi.com/api/")!

    @Published private(set) var previewCharacters: [RyckAndMortyCharacter] = []
    @Published private(set) var isMoreDataAvailable: Bool = true
    @Published private(set) var paginationState: PaginationState = .loadMore

    private var cancellable: Cancellable?
    private var currentPage: Int = 1

    init(characters: [RyckAndMortyCharacter] = []) {
        self.previewCharacters = characters

    }

    func loadMoreItems() {
        self.paginationState = .isLoading
        self.fetchCharacters()
    }

    private func fetchCharacters() {
        cancellable = makeRemoteCharacterLoader(currentPage).handleEvents(receiveCancel: { [weak self] in
                self?.paginationState = .noResults
        })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    self.paginationState = .loadMore

                case let .failure(error):
                    print(error.localizedDescription)
                    self.paginationState = .loadedAll
                }
            }, receiveValue: { [weak self] resource in
                guard let self = self else { return }
                self.currentPage += 1
                resource.forEach {self.previewCharacters.append($0)}
            })
    }

    private lazy var httpClient: HTTPClient = {
        URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))
    }()

    private func makeRemoteCharacterLoader(_ page: Int = 1) ->
    AnyPublisher<[RyckAndMortyCharacter], Error> {
        let url = CharactersEndPoint.get(page: page).url(baseURL: baseURL)
        return httpClient
                .getPublisher(url: url)
                .tryMap(CharacterItemsMapper.map)
                .eraseToAnyPublisher()
    }
}

public extension HTTPClient {
    typealias Publisher = AnyPublisher<(Data, HTTPURLResponse), Error>

    func getPublisher(url: URL) -> Publisher {
        var task: HTTPClientTask?
        return Deferred {
            Future { completion in
                task = self.get(from: url, completion: completion)
            }
        }
        .handleEvents(receiveCancel: { task?.cancel() })
        .eraseToAnyPublisher()
    }
}
