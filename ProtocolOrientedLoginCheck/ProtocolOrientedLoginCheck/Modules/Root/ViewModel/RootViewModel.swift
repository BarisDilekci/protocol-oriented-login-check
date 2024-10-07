//
//  RootViewModel.swift
//  ProtocolOrientedLoginCheck
//
//  Created by Barış Dilekçi on 6.10.2024.
//

import Foundation

protocol RootViewModelProtocol : AnyObject {
    func showLoginScreen()
    func showMainScreen()
}

class RootViewModel {
    
    private let loginStorageService : LoginStorageService
    
    weak var output : RootViewModelProtocol?
    
    init(loginStorageService: LoginStorageService) {
        self.loginStorageService = loginStorageService
    }
    
    func checkLogin() {
        if let accessToken = loginStorageService.getUserAccessToken() , !accessToken.isEmpty {
            output?.showMainScreen()
        } else {
            output?.showLoginScreen()
        }
    }
}


