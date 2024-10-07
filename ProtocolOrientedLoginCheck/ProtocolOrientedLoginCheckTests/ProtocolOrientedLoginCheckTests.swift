//
//  ProtocolOrientedLoginCheckTests.swift
//  ProtocolOrientedLoginCheckTests
//
//  Created by Barış Dilekçi on 6.10.2024.
//

import XCTest
@testable import ProtocolOrientedLoginCheck

final class ProtocolOrientedLoginCheckTests: XCTestCase {
    
    private var sut : RootViewModel!
    private var loginStorageService : MockLoginStorageService!
    private var output : MockRootViewModelProtocol!

    override func setUpWithError() throws {
        loginStorageService = MockLoginStorageService()
        output = MockRootViewModelProtocol()
        sut = RootViewModel(loginStorageService: loginStorageService)
        sut.output = output
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        loginStorageService = nil
    }

    func testShowLogin_whenLoginStorageReturnsEmptyUserAccessToken() throws {
           //given
           loginStorageService.storage = [:] //No access token
           //when
           sut.checkLogin()
           //then
           XCTAssertEqual(output.check.count, 1)
           XCTAssertEqual(output.check.first, .login)
               
       }
       
       func testShowLogin_whenLoginStorageReturnsEmptyString() throws {
           //given
           loginStorageService.storage["ACCESS_TOKEN"] = "" //returns empty string
           //when
           sut.checkLogin()
           //then
           XCTAssertEqual(output.check.count, 1)
           XCTAssertEqual(output.check.first, .login)
               
       }

}

class MockLoginStorageService: LoginStorageService {
    override var userAccessTokenKey: String {
        return "ACCESS_TOKEN"
    }
    
    var storage : [String : String] = [:]
    
    override func setUserAccessToken(token: String) {
        storage[userAccessTokenKey] = token
    }
    
    override func getUserAccessToken() -> String? {
        return storage[userAccessTokenKey]
    }
    
}

class MockRootViewModelProtocol: RootViewModelProtocol {
    
    enum Check {
           case login
           case mainApp
       }
       
       var check : [Check] = []
       
       func showLoginScreen() {
           check.append(.login)
       }
       
       func showMainScreen() {
           check.append(.mainApp)
       }
}
