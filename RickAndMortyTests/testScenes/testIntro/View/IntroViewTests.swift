//
//  IntroViewTests.swift
//  RickAndMortyTests
//
//  Created by Raul Quispe  on 28/09/23.
//

import XCTest
import ViewInspector

@testable import RickAndMorty
import SwiftUI

final class IntroViewTests: XCTestCase {

    func testEnterButton() throws {
        let sut = IntroView()
        let expect = IntroLocalizable.Title.Button.normal
        let button = try sut.inspect().find(button: expect)
        XCTAssertEqual(try button.id(), "enterButton")
    }

    func testMessageText() throws {
        let sut = IntroView()
        let expect = IntroLocalizable.Message.Text.normal
        let text = try sut.inspect().find(text: expect)
        XCTAssertEqual(try text.id(), "messageText")
    }

    func testLogoIntroImage() throws {
        let sut = IntroView()
        let logo = sut.logo
        XCTAssertNotNil(logo)
    }
}


