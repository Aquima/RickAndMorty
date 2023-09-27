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
    public let status: Status
    public let image: String

    public init(id: UUID, dbid: Int, name: String, status: Status, image: String) {
        self.dbid = dbid
        self.id = id
        self.name = name
        self.status = status
        self.image = image
    }
}

// MARK: - Info
public struct Info: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
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

public enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
