//
//  LoginResponse.swift
//  BookStore
//
//  Created by Wai Thura Tun on 02/05/2024.
//

import Foundation

struct LoginResponse: Codable {
    let code: Int
    let message: String?
    let data: LoginVO?
    
    enum CodingKeys: String, CodingKey {
        case code, message, data
    }
}

struct LoginVO: Codable {
    let accessToken: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
}

typealias RegisterResponse = LoginResponse
