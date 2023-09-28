//
//  CharacterDataMapperTests.swift
//  RickAndMortyTests
//
//  Created by Raul Quispe  on 27/09/23.
//

import XCTest
import RickAndMorty

final class CharacterDataMapperTests: XCTestCase {
    
    func testMapThrowsErrorOnNon200HTTPResponse() throws {
        let samples = [199, 201, 300, 400, 500]
        
        try samples.forEach { code in
            XCTAssertThrowsError(
                try CharacterDataMapper.map(anyData(), from: HTTPURLResponse(statusCode: code))
            )
        }
    }
    
    func testMapDeliversInvalidDataErrorOn200HTTPResponseWithEmptyData() {
        let emptyData = Data()
        
        XCTAssertThrowsError(
            try CharacterDataMapper.map(emptyData, from: HTTPURLResponse(statusCode: 200))
        )
    }
    
    func testMapDeliversReceivedNonEmptyDataOn200HTTPResponse() throws {
        let nonEmptyData = Data("nonEmpty data".utf8)
        
        let result = try CharacterDataMapper.map(nonEmptyData, from: HTTPURLResponse(statusCode: 200))
        
        XCTAssertEqual(result, nonEmptyData)
    }
    
}
