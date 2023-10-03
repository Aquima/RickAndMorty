//
//  CharacterItemsMapper.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 26/09/23.
//

import Foundation

public final class CharacterItemsMapper {

    private struct RemoteCharacterItem: Decodable {
        let id: Int
        let name: String
        let status: String
        let image: String
        let species: String
        let gender: String
    }

    private struct Root: Decodable {
        private let results: [RemoteCharacterItem]

        var characters: [RyckAndMortyCharacter] {

            results.map { RyckAndMortyCharacter(id: UUID(),
                                                dbid: $0.id,
                                                name: $0.name,
                                                status: StatusCharacter(rawValue: $0.status) ?? .alive,
                                                image: $0.image,
                                                species: Species(rawValue: $0.species) ?? .human,
                                                gender: Gender(rawValue: $0.gender) ?? .unknown)}
        }
    }

    public enum Error: Swift.Error {
        case invalidData
    }

    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> [RyckAndMortyCharacter] {
        guard response.isOK, let root = try? JSONDecoder().decode(Root.self, from: data) else {
            throw Error.invalidData
        }
        return root.characters
    }
}
