//
//  StringExtensionTests.swift
//  TripWirelessTests
//
//  Created by Rashida on 23/11/18.
//  Copyright © 2018 Rashida. All rights reserved.
//

import XCTest

class StringExtensionTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    // phone number format
    func testPhoneNumberFormat() {
        let number = "1234567890"
        let formatedNum = number.toPhoneNumberFormat()
        XCTAssertEqual(formatedNum, "123-456-7890")
    }
    
    func testPhoneNumberFormatWithBraces() {
        let number = "1234567890"
        let formatedNum = number.toPhoneNumberFormatWithBraces()
        XCTAssertEqual(formatedNum, "(123) 456-7890")
    }
    
    func testRemoveSpecialCharactersFromNumber() {
        let number = "(123) 456-7890"
        let noSpecialChars = number.removeSpecialCharsFromNumber
        XCTAssertEqual(noSpecialChars, "(123)4567890")
    }

    
    
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
