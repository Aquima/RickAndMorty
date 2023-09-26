//
//  RyckAndMortyCharacter.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 26/09/23.
//

import Foundation

// MARK: - RyckAndMortyCharacter
struct RyckAndMortyCharacter: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let status: Status
    let image: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
