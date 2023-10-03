//
//  RyckAndMortyCharacter.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 26/09/23.
//

import Foundation

// MARK: - RyckAndMortyCharacter
public struct RyckAndMortyCharacter: Identifiable, Hashable {

    public let id: UUID
    public let dbid: Int
    public let name: String
    public let status: StatusCharacter
    public let image: String
    public let species: Species
    public let gender: Gender
//    public let location: LocationCharacter

    public init(id: UUID,
                dbid: Int,
                name: String,
                status: StatusCharacter,
                image: String,
                species: Species,
                gender: Gender) {
        self.dbid = dbid
        self.id = id
        self.name = name
        self.status = status
        self.image = image
        self.species = species
        self.gender = gender
    }
}

public enum Gender: String {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
public struct LocationCharacter {
    let name: String
    let url: String
}

public enum Species: String {
    case alien = "Alien"
    case human = "Human"
}

public enum StatusCharacter: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
