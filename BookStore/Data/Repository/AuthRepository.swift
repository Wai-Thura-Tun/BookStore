//
//  AuthRepository.swift
//  BookStore
//
//  Created by Wai Thura Tun on 15/05/2024.
//

import Foundation

class AuthRepository {
    private let authRemoteDataSource: AuthRemoteDataSource = .init()
    
    func login(username: String,
               password: String,
               onSuccess: @escaping () -> (),
               onFailed: @escaping (AuthDataError) -> ())
    {
        authRemoteDataSource.login(
            username: username,
            password: password,
            onSuccess: { token in
                KeychainManager.shared.setAccessToken(with: token)
                UserDefaults.setOldUser()
                onSuccess()
            },
            onFailed: onFailed
        )
    }
    
    func signUp(username: String,
                  email: String,
                  phone: String,
                  password: String,
                  onSuccess: @escaping () -> (),
                  onFailed: @escaping (AuthDataError) -> ())
    {
        authRemoteDataSource.signUp(
            username: username,
            email: email,
            phone: phone,
            password: password,
            onSuccess: { token in
                KeychainManager.shared.setAccessToken(with: token)
                UserDefaults.setOldUser()
            },
            onFailed: onFailed)
    }
}
