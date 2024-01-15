//
//  LoginValidatorTests.swift
//  StarWarsTests
//
//  Created by James Milton on 15/01/2024.
//

import XCTest

final class LoginValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testEmailValid_NoThrow() throws {
        XCTAssertNoThrow(try LoginValidator.validateEmail("test@test.com"))
        XCTAssertNoThrow(try LoginValidator.validateEmail("test@test.co.uk"))
        XCTAssertNoThrow(try LoginValidator.validatePassword("12345678"))
    }
    
    func testPasswordValid_NoThrow() throws {
        XCTAssertNoThrow(try LoginValidator.validatePassword("12345678"))
    }
    
    func testInvalidEmail_Throws() throws {
        XCTAssertThrowsError(try LoginValidator.validateEmail("testtest.com"))
        XCTAssertThrowsError(try LoginValidator.validateEmail("test@testcom"))
        XCTAssertThrowsError(try LoginValidator.validateEmail("test"))
        XCTAssertThrowsError(try LoginValidator.validateEmail("test@test."))
        XCTAssertThrowsError(try LoginValidator.validateEmail(""))
    }
    
    func testPasswordInvalid_Throws() throws {
        XCTAssertThrowsError(try LoginValidator.validatePassword("1234567"))
        XCTAssertThrowsError(try LoginValidator.validatePassword(""))
    }

}
