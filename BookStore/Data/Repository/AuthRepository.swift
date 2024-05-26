//
//  AuthRepository.swift
//  BookStore
//
//  Created by Wai Thura Tun on 15/05/2024.
//

import Foundation

class AuthRepository {
    private let authRemoteDataSource: AuthRemoteDataSource = .init()
    private let localDataSource: AuthLocalDataSource = .shared
    
    func login(username: String,
               password: String,
               onSuccess: @escaping () -> (),
               onFailed: @escaping (AuthDataError) -> ())
    {
        authRemoteDataSource.login(
            username: username,
            password: password,
            onSuccess: { [weak self] token, userEntity  in
                KeychainManager.shared.setAccessToken(with: token)
                UserDefaults.setOldUser()
                do {
                    try self?.localDataSource.saveUser(with: userEntity)
                    onSuccess()
                }
                catch {
                    onFailed(.UNKOWN("Something went wrong"))
                }
            },
            onFailed: onFailed
        )
    }
    
    func getUser() -> UserVO? {
        return localDataSource.getUser()
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
            onSuccess: { [weak self] token, userEntity  in
                KeychainManager.shared.setAccessToken(with: token)
                UserDefaults.setOldUser()
                do {
                    try self?.localDataSource.saveUser(with: userEntity)
                    onSuccess()
                }
                catch {
                    onFailed(.UNKOWN("Something went wrong"))
                }
            },
            onFailed: onFailed)
    }
}
