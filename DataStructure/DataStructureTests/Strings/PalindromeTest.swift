//
//  PalindromeTest.swift
//  DataStructureTests
//
//  Created by Jigs Sheth on 11/8/21.
//  Copyright © 2021 jigneshsheth.com. All rights reserved.
//

import XCTest
@testable import DataStructure

class PalindromeTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
			XCTAssertTrue(Palindrome().isPalindrome(121))
			XCTAssertFalse(Palindrome().isPalindrome(-121))

		}

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
