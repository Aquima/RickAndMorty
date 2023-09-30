//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 26/09/23.
//

import Foundation
import Combine

final class CharacterListViewModel: ObservableObject {
    private var service: CharacterListViewModelProtocol?
    private(set) var titleNavigation = "Characters"
    @Published private(set) var previewCharacters: [RyckAndMortyCharacter] = []
    @Published private(set) var paginationState: PaginationState = .loadMore

    init(characters: [RyckAndMortyCharacter] = []) {
        self.previewCharacters = characters
        self.service = FetchCharacterListAPI()
    }

    func loadMoreItems() {
        self.paginationState = .isLoading
        self.fetchCharacters()
    }

    private func fetchCharacters() {
        service?.loadCharacters({ characters, paginationState in
            self.previewCharacters = characters
            self.paginationState = paginationState
        })
    }

}
