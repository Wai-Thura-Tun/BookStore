//
//  KeychainManager.swift
//  BookStore
//
//  Created by Wai Thura Tun on 20/05/2024.
//

import Foundation
import KeychainAccess

class KeychainManager {
    private let keychain: Keychain
    static let shared: KeychainManager = .init()
    private let ACCESS_TOKEN_KEY: String = "ACCESS_TOKEN"
    
    private init() {
        keychain = Keychain(service: "com.bookstore.keychain")
    }
    
    func setAccessToken(with token: String) {
        keychain[ACCESS_TOKEN_KEY] = token
    }
    
    func getAccessToken() -> String? {
        return keychain[ACCESS_TOKEN_KEY]
    }
    
    func deleteAccessToken() {
        return keychain[ACCESS_TOKEN_KEY] = nil
    }
}
