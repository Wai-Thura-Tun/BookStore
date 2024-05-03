//
//  RegisterResponse.swift
//  BookStore
//
//  Created by Wai Thura Tun on 02/05/2024.
//

import Foundation

struct RegisterResponse: Codable {
    let code: Int
    let message: String?
    let data: RegisterVO?
    
    enum CodingKeys: String, CodingKey {
        case code, message, data
    }
}

struct RegisterVO: Codable {
    let accessToken: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
}
