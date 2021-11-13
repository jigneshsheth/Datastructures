//
//  UniqueEmailAddressesTest.swift
//  DataStructureTests
//
//  Created by Jigs Sheth on 11/8/21.
//  Copyright © 2021 jigneshsheth.com. All rights reserved.
//

import XCTest
@testable import DataStructure

class UniqueEmailAddressesTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
			var emails = ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
			
			XCTAssertEqual(2,UniqueEmailAddresses().numUniqueEmails(emails))
			
			emails = ["a@leetcode.com","b@leetcode.com","c@leetcode.com"]
			
			XCTAssertEqual(3,UniqueEmailAddresses().numUniqueEmails(emails))
			
		}
	
	
	func testUniqueEmailAddressesWithSet() throws {
		var emails = ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
		
		XCTAssertEqual(2,UniqueEmailAddresses().numUniqueEmailsWithSet(emails))
		
		emails = ["a@leetcode.com","b@leetcode.com","c@leetcode.com"]
		
		XCTAssertEqual(3,UniqueEmailAddresses().numUniqueEmailsWithSet(emails))
		
	}

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}