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
    let userName: String?
    let email: String?
    let phoneNumber: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case userName = "user_name"
        case email
        case phoneNumber = "phone_number"
    }
}

typealias RegisterResponse = LoginResponse

struct UserVO {
    let userName: String
    let email: String
    let phoneNumber: String
}
