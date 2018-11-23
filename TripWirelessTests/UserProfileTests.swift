//
//  UserProfileTests.swift
//  TripWirelessTests
//
//  Created by Rashida on 19/11/18.
//  Copyright © 2018 Rashida. All rights reserved.
//

import XCTest
@testable import TripWireless

class UserProfileTests: XCTestCase {

    
    let userBusiness = UserBusiness()
    var fieldError: NSError?
    
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
    
    
    // for valid email format
    func testEmailValidationWithValidFormat() {
        let email = "rash@ggg.com"
//        let business = UserBusiness()
        userBusiness.loginValidator.emailValidator.input = email
       
       let isValid = userBusiness.loginValidator.emailValidator.validateWithError(error: &fieldError)
        XCTAssertTrue(isValid)
        
    }
    // for invalid email format
    func testEmailValidationWithInvalidFormat() {
        let email = "Rash@com"
        userBusiness.loginValidator.emailValidator.input = email
        var fieldError: NSError?
        let isValid = userBusiness.loginValidator.emailValidator.validateWithError(error: &fieldError)
        XCTAssertFalse(isValid)
        
    }
    
    // for password validation
    func testPasswordValidation() {
        let password = "123we"
        userBusiness.loginValidator.passwordValidator.input = password
        let isValid = userBusiness.loginValidator.passwordValidator.validateWithError(error: &fieldError)
        // test will fail if we get isValid false
        XCTAssert(isValid)
        
    }
    
    // first name validation for non empty
    func testFirstNameValidation() {
        let firstName = "rashida"
      userBusiness.registrationValidator.firstNameValidator.input = firstName
        let isEmpty = userBusiness.registrationValidator.firstNameValidator.validateWithError(error: &fieldError)
       // XCTAssert(isEmpty, "not empty")
        XCTAssertTrue(isEmpty, fieldError!.domain)
    }
    
    // first name validation for empty
    func testFirstNameValidationEmpty() {
        let name = ""
        userBusiness.registrationValidator.firstNameValidator.input = name
        let isEmpty = userBusiness.registrationValidator.firstNameValidator.validateWithError(error: &fieldError)
        
        XCTAssert(isEmpty, fieldError!.domain)
    }
     // last name validation for empty
    func testLastNameValidationEmpty() {
        let name = ""
        userBusiness.registrationValidator.lastNameValidator.input = name
        let isEmpty = userBusiness.registrationValidator.lastNameValidator.validateWithError(error: &fieldError)
        
        XCTAssert(isEmpty, fieldError!.domain)
    }
    
    // company name validation
    func testCompanyNameValidationEmpty() {
        let name = ""
        userBusiness.registrationValidator.companyNameValidator.input = name
        let isEmpty = userBusiness.registrationValidator.companyNameValidator.validateWithError(error: &fieldError)
        
        XCTAssert(isEmpty, fieldError!.domain)
    }
    
    // phone number validation() {
    func testPhoneNumberValidation() {
        let number = "1234567890"
        userBusiness.registrationValidator.phonNumberValidator.input = number
        let status = userBusiness.registrationValidator.phonNumberValidator.validateWithError(error: &fieldError)
        XCTAssert(status, fieldError!.domain)
    }
    
   
    
    
    


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
