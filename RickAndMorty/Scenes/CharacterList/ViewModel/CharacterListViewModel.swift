//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 26/09/23.
//

import Foundation
final class CharacterListViewModel: ObservableObject {

    internal enum PaginationState {
        case isLoading
        case loadMore
        case loadedAll
        case noResults
        case error(String)
    }

    @Published private(set) var previewCharacters: [RyckAndMortyCharacter] = []
    @Published private(set) var isMoreDataAvailable: Bool = true
    @Published private(set) var paginationState: PaginationState = .isLoading

    init(characters: [RyckAndMortyCharacter] = []) {
        self.previewCharacters = characters
        previewCharacters = [RyckAndMortyCharacter(name: "Rick",
                                                   status: .alive,
                                                   image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
                             RyckAndMortyCharacter(name: "Morty",
                                                   status: .dead,
                                                   image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"),
                             RyckAndMortyCharacter(name: "Summer Smith",
                                                   status: .dead,
                                                   image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg"),
                             RyckAndMortyCharacter(name: "Beth Smith",
                                                   status: .dead,
                                                   image: "https://rickandmortyapi.com/api/character/avatar/4.jpeg"),
                             RyckAndMortyCharacter(name: "Jerry Smith",
                                                   status: .dead,
                                                   image: "https://rickandmortyapi.com/api/character/avatar/5.jpeg")]
    }

    func loadMoreItems() {
        self.paginationState = .isLoading
        self.fetchCharacters()
    }
    
    private func fetchCharacters() {
        
    }
}
