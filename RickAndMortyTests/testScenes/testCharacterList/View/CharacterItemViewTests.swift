//
//  CharacterItemViewTests.swift
//  RickAndMortyTests
//
//  Created by Raul Quispe  on 1/10/23.
//

import XCTest
import ViewInspector
@testable import RickAndMorty

final class CharacterItemViewTests: XCTestCase {

    func testTextNameNotNil() throws {
        let sut = CharacterItemView(character: .constant(RyckAndMortyCharactersListStub.previewCharacters[0]))
        let body = sut.body
        XCTAssertNotNil(body)
        let expectId = "Rick"
        let text = try sut.inspect().find(text: expectId)
        XCTAssertNotNil(text)
    }
    
    func testTextStatusNotNil() throws {
        let sut = CharacterItemView(character: .constant(RyckAndMortyCharactersListStub.previewCharacters[0]))
        let body = sut.body
        XCTAssertNotNil(body)
        let expectId = "Alive"
        let text = try sut.inspect().find(text: expectId)
        XCTAssertNotNil(text)
    }
}
