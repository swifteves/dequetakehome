//
//  FranchiseCharacterTests.swift
//  DequeTests
//
//  Created by Adrian Eves on 4/25/24.
//

import XCTest
@testable import Deque

final class FranchiseCharacterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFormattedAliases() throws {
        let character = FranchiseCharacter(aliases: "Quasi\nLover Boy\nHunchback", name: "Quasimodo")
        let formattedAliases = character.formattedAliases
        XCTAssertEqual(formattedAliases, "Quasi, Lover Boy, and Hunchback")
    }

}
