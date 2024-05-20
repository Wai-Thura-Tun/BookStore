//
//  UserDefultsManager.swift
//  BookStore
//
//  Created by Wai Thura Tun on 28/04/2024.
//

import Foundation

extension UserDefaults {
    static let OLD_USER: String = "OldUser"
    
    static func setOldUser() {
        standard.set(true, forKey: OLD_USER)
    }
    
    static func IsOldUser() -> Bool {
        return standard.bool(forKey: OLD_USER)
    }
}
