//
//  AccountTest.swift
//  HW49UnitTestsTests
//
//  Created by Вячеслав Башур on 13/12/2024.
//

import XCTest

@testable import HW49UnitTests

class AccountTests: XCTestCase {
    var account: Account!
    
    override func setUp() {
        self.account = .init(
            users: TestData.users
        )
    }
    
    func testLoginPositive() {
        let login = TestData.correctLogin
        let password = TestData.correctPassword
        let result = account.login(login: login, password: password)
        XCTAssertEqual(result, .success(true))
    }
    
    func testPasswordIsEmpty() {
        let login = TestData.correctLogin
        let password = TestData.passwordIsEmpty
        let result = account.login(login: login, password: password)
        XCTAssertEqual(result, .failure(.passwordIsEmpty))
    }
    
    func testLoginIsEmpty() {
        let login = TestData.loginIsEmpty
        let password = TestData.tooShortPassword
        let result = account.login(login: login, password: password)
        XCTAssertEqual(result, .failure(.loginIsEmpty))
    }
    
    func testLogintoShortPassword() {
        let login = TestData.correctLogin
        let password = TestData.tooShortPassword
        let result = account.login(login: login, password: password)
        XCTAssertEqual(result, .failure(.toShortPassword))
    }
    
    func testLogintoLongUsername() {
        let login = TestData.loginOverMaxUserLength
        let password = TestData.correctPassword
        let result = account.login(login: login, password: password)
        XCTAssertEqual(result, .failure(.toLongUsername))
    }
    
    func testLoginWrongPassword() {
        let login = TestData.correctLogin
        let password = TestData.wrongPassword
        let result = account.login(login: login, password: password)
        XCTAssertEqual(result, .failure(.wrongPassword))
    }
    
    func testRegisterPositive() {
        // given
        let login = TestData.correctRegisterLogin
        let password = TestData.correctRegisterPassword
        // when
        let result = account.register(login: login, password: password)
        // then
        XCTAssertEqual(result, .success(login))
    }
    
    func test_RegisterUserExist() {
        // given
        let login = TestData.existUserLogin
        let password = TestData.correctRegisterPassword
        // when
        let result = account.register(login: login, password: password)
        // then
        XCTAssertEqual(result, .failure(.userExist))
    }
    
    func test_RegisterUserWhitespaces() {
        // given
        var login = " "
        let password = TestData.correctRegisterPassword
        // when
        var result = account.register(login: login, password: password)
        // then
        XCTAssertEqual(result, .failure(.whitespaces))
        // given
        login = "  "
        // when
        result = account.register(login: login, password: password)
        // then
        XCTAssertEqual(result, .failure(.whitespaces))
        // given
        login = "                   "
        // when
        result = account.register(login: login, password: password)
        // then
        XCTAssertEqual(result, .failure(.whitespaces))
    }
    
    func test_RegisteUserMaxUserLength() {
        // given
        let login = TestData.loginOverMaxUserLength
        let password = TestData.correctRegisterPassword
        // when
        let result = account.register(login: login, password: password)
        // then
        XCTAssertEqual(result, .failure(.toLongUsername))
    }
    
    func test_RegisterToShortPassword() {
        // given
        let login = TestData.correctRegisterLogin
        let password = TestData.tooShortPassword
        // when
        let result = account.register(login: login, password: password)
        // then
        XCTAssertEqual(result, .failure(.toShortPassword))
    }
    
}

extension AccountTests {
    enum TestData {
        static var notExistPassword = "11223344"
        static var notExistLogin = "boriska22"
        static var wrongPassword = "11223344"
        static var loginIsEmpty = ""
        static var passwordIsEmpty = ""
        
        static var tooShortPassword = "qwerewq"
        static var loginOverMaxUserLength = "imnewuser"
        static var existUserLogin = correctLogin
        static var correctRegisterLogin = "inewuser"
        static var correctRegisterPassword = "somepass"
        static var correctLogin = "serge222"
        static var correctPassword = "qwerty1234"
        static var incorrectLogin = "somelogin222"
        static var incorrectPassword = "aq22222"
        static var users = [
           correctLogin : correctPassword,
           "sasha1337" : "djiu13j222"
        ]
    }
}
