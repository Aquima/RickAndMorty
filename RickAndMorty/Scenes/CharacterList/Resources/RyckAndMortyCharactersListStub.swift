//
//  RyckAndMortyCharactersListStub.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 27/09/23.
//

import Foundation
struct RyckAndMortyCharactersListStub {
    static let previewCharacters: [RyckAndMortyCharacter] =
    [RyckAndMortyCharacter(id: UUID(),
                           dbid: 1,
                           name: "Rick",
                           status: .alive,
                           image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
     RyckAndMortyCharacter(id: UUID(),
                           dbid: 2,
                           name: "Morty",
                           status: .dead,
                           image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"),
     RyckAndMortyCharacter(id: UUID(),
                           dbid: 3,
                           name: "Summer Smith",
                           status: .dead,
                           image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg"),
     RyckAndMortyCharacter(id: UUID(),
                           dbid: 4,
                           name: "Beth Smith",
                           status: .alive,
                           image: "https://rickandmortyapi.com/api/character/avatar/4.jpeg"),
     RyckAndMortyCharacter(id: UUID(),
                           dbid: 5,
                           name: "Jerry Smith",
                           status: .alive,
                           image: "https://rickandmortyapi.com/api/character/avatar/5.jpeg")]
}
