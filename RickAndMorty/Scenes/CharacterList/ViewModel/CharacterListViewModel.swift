//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 26/09/23.
//

import Foundation
final class CharacterListViewModel: ObservableObject {

    @Published private(set) var previewCharacters: [RyckAndMortyCharacter] = []
    
    init(characters: [RyckAndMortyCharacter] = []) {
        self.previewCharacters = characters
        previewCharacters = [RyckAndMortyCharacter(name: "Rick",
                                                   status: .alive,
                                                   image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
                             RyckAndMortyCharacter(name: "Morty",
                                                   status: .dead,
                                                   image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")]
    }
}
