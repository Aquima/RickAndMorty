//
//  CharacterListViewTests.swift
//  RickAndMortyTests
//
//  Created by Raul Quispe  on 29/09/23.
//

import XCTest
import ViewInspector
@testable import RickAndMorty

final class CharacterListViewTests: XCTestCase {

    func testListNotNil() throws {
        let sut = CharacterListView()
        let expectId = "CharactersList"
        let list = try sut.inspect().find(viewWithId: expectId)
        XCTAssertNotNil(list)
    }
    
    func testCharacterLastRowViewNotNil() throws {
        let sut = CharacterListView()
        let body = sut.body
        XCTAssertNotNil(body)
        let expectId = "CharacterLastRowView"
        let characterListView = try sut.inspect().find(viewWithId: expectId)
        XCTAssertNotNil(characterListView)
    }
    
    func testListCurrentPath() throws {
        let sut = CharacterListView()
        XCTAssertEqual(try sut.inspect().find(ViewType.List.self).pathToRoot,
                       "view(CharacterListView.self).navigationStack().list()")
    }

    func testNavigationStackTitle() throws {
        let sut = CharacterListView()
        let expect = "Characters"
        let titleNavigation = sut.viewModel.titleNavigation
        XCTAssertEqual(titleNavigation, expect)
    }

}
