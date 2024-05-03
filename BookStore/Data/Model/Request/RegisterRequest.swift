//
//  RegisterRequest.swift
//  BookStore
//
//  Created by Wai Thura Tun on 02/05/2024.
//

import Foundation

struct RegisterRequest: Encodable {
    let userName: String?
    let email: String?
    let phoneNumber: String?
    let password: String?
    
    enum CodingKeys: String, CodingKey {
        case email, password
        case userName = "user_name"
        case phoneNumber = "phone_number"
    }
}
