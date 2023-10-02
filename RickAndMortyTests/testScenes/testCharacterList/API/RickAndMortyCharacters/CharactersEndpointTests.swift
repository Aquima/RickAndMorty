//
//  CharactersEndpointTests.swift
//  RickAndMortyTests
//
//  Created by Raul Quispe  on 27/09/23.
//

import XCTest
import RickAndMorty

final class CharactersEndpointTests: XCTestCase {
    
    func testCharactersEndpointURL() {
        let baseURL = URL(string: "http://any_base_url.com")!
        
        let received = CharactersEndPoint.get().url(baseURL: baseURL)
        XCTAssertEqual(received.scheme, "http", "scheme")
        XCTAssertEqual(received.host, "any_base_url.com", "host")
        XCTAssertEqual(received.path, "/character", "path")
        XCTAssertEqual(received.query, "page=1", "query")
    }
    
    func testCharactersEndpointURLAfterGivenImage() {
        let page: Int = 1
        let baseURL = URL(string: "http://any_base_url.com")!
        
        let received = CharactersEndPoint.get(page: page, name: "rick").url(baseURL: baseURL)
        
        XCTAssertEqual(received.scheme, "http", "scheme")
        XCTAssertEqual(received.host, "any_base_url.com", "host")
        XCTAssertEqual(received.path, "/character", "path")
        XCTAssertEqual(received.query?.contains("page=1"), true, "page query param")
        XCTAssertEqual(received.query?.contains("name=rick     "), true, "name query param")
    }
}
