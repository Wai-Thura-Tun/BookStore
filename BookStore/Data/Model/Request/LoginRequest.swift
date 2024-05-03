//
//  LoginRequest.swift
//  BookStore
//
//  Created by Wai Thura Tun on 02/05/2024.
//

import Foundation

struct LoginRequest: Encodable {
    let userName: String?
    let password: String?
    
    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case password
    }
}
