//
//  CharacterItemsMapperTests.swift
//  RickAndMortyTests
//
//  Created by Raul Quispe  on 26/09/23.
//

import XCTest
import RickAndMorty

final class CharacterItemsMapperTests: XCTestCase {
    
    func testMapThrowsErrorOnNon200HTTPResponse() throws {
        let json = makeItemsJSON([])
        let samples = [199, 201, 300, 400, 500]
        
        try samples.forEach { code in
            XCTAssertThrowsError(
                try CharacterItemsMapper.map(json, from: HTTPURLResponse(statusCode: code))
            )
        }
    }
    
    func testMapThrowsErrorOn200HTTPResponseWithInvalidJSON() {
        let invalidJSON = Data("invalid json".utf8)
        
        XCTAssertThrowsError(
            try CharacterItemsMapper.map(invalidJSON, from: HTTPURLResponse(statusCode: 200))
        )
    }
    
    func testMapDeliversNoItemsOn200HTTPResponseWithEmptyJSONList() throws {
        let emptyListJSON = makeItemsJSON([])
        
        let result = try CharacterItemsMapper.map(emptyListJSON, from: HTTPURLResponse(statusCode: 200))
        
        XCTAssertEqual(result, [])
    }
    
    func testMapDeliversItemsOn200HTTPResponseWithJSONItems() throws {
        let item1 = makeItem(
            id: UUID(),
            dbid: 1,
            name:"Ryck",
            status: .alive,
            imageURL: "http://a_url.com",
            species: .human,
            gender: .unknown)
        
        let item2 = makeItem(
            id: UUID(),
            dbid: 2,
            name: "Morty",
            status: .alive,
            imageURL: "http://another_url.com",
            species: .human,
            gender: .unknown)
        
        let json = makeItemsJSON([item1.json, item2.json])
        
        let result = try CharacterItemsMapper.map(json, from: HTTPURLResponse(statusCode: 200))
        
        XCTAssertEqual(result.first?.name, item1.model.name)
        XCTAssertNotEqual(result.first?.id, item1.model.id)
        XCTAssertEqual(result.first?.status, item1.model.status)
        XCTAssertEqual(result.first?.dbid, item1.model.dbid)
        
        XCTAssertEqual(result.last?.name, item2.model.name)
        XCTAssertNotEqual(result.last?.id, item2.model.id)
        XCTAssertEqual(result.last?.status, item2.model.status)
        XCTAssertEqual(result.last?.dbid, item2.model.dbid)

    }
    
    // MARK: - Helpers
    
    private func makeItem(id:UUID, dbid: Int, name: String, status: StatusCharacter = .alive, imageURL: String, species: Species = .human, gender: Gender = .unknown) -> (model: RyckAndMortyCharacter, json: [String: Any]) {
        let item = RyckAndMortyCharacter(id: id, dbid: dbid, name: name, status: .alive, image: imageURL, species: species, gender: gender)
        let json = [
            "id": dbid,
            "name": name,
            "status": status.rawValue,
            "image": imageURL,
            "species": species.rawValue,
            "gender": gender.rawValue
        ].compactMapValues { $0 }
        
        return (item, json)
    }
    
}
