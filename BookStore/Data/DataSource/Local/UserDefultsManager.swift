//
//  UserDefultsManager.swift
//  BookStore
//
//  Created by Wai Thura Tun on 28/04/2024.
//

import Foundation

extension UserDefaults {
    static let ACCESS_TOKEN_KEY: String = "ACCESS_TOKEN"
    
    static func setAccessToken(token: String) {
        standard.setValue(token, forKey: ACCESS_TOKEN_KEY)
    }
    
    static func getAccessToken() -> String? {
        return standard.string(forKey: ACCESS_TOKEN_KEY)
    }
}
