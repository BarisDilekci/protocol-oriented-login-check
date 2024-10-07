//
//  LoginStorageService.swift
//  ProtocolOrientedLoginCheck
//
//  Created by Barış Dilekçi on 6.10.2024.
//

import Foundation

protocol LoginStorageServiceProtocol{
    var userAccessTokenKey : String { get }
    func setUserAccessToken(token: String)
    func getUserAccessToken() -> String?
}

class LoginStorageService : LoginStorageServiceProtocol {
    
    private let storage = UserDefaults.standard
    
    var userAccessTokenKey: String {
        return "ACCESS_TOKEN"
    }
    
    func setUserAccessToken(token: String) {
        storage.set(token, forKey: userAccessTokenKey)
    }
    
    func getUserAccessToken() -> String? {
        return storage.string(forKey: userAccessTokenKey)
    }
}
