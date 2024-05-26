//
//  AuthRemoteDataSource.swift
//  BookStore
//
//  Created by Wai Thura Tun on 14/05/2024.
//

import Foundation

enum AuthDataError {
    case NEW_USER
    case DUPLICATE_USER
    case UNKOWN(String)
}

class AuthRemoteDataSource {
    private let network:NetworkManager = .shared
    private let newUserErrorCode: Int = 404
    private let duplicateUserErrorCode: Int = 409
    
    func login(username: String,
               password: String,
               onSuccess: @escaping (String, UserEntity) -> (),
               onFailed: @escaping (AuthDataError) -> ())
    {
        network.request(endPoint: .Login(
            LoginRequest.init(userName: username,
                              password: password)
        )) { (response: LoginResponse) in
            if response.code == 0, let loginVO = response.data, let token = response.data?.accessToken, !token.isEmpty {
                let user = UserVO.init(
                    userName: loginVO.userName ?? "",
                    email: loginVO.email ?? "",
                    phoneNumber: loginVO.phoneNumber ?? ""
                )
                onSuccess(token, user.toEntity())
            }
            else {
                onFailed(.UNKOWN("Something went wrong"))
            }
        } onFailed: { error in
            switch error {
            case let .UNEXPECTED_STATUS_CODE(code):
                if code == self.newUserErrorCode {
                    onFailed(.NEW_USER)
                }
                else {
                    onFailed(.UNKOWN(error.customMessage))
                }
            default:
                onFailed(.UNKOWN(error.customMessage))
            }
        }

    }
    
    func signUp(username: String,
                  email: String,
                  phone: String,
                  password: String,
                  onSuccess: @escaping (String, UserEntity) -> (),
                  onFailed: @escaping (AuthDataError) -> ())
    {
        network.request(endPoint: .Register(
            RegisterRequest.init(userName: username,
                                 email: email,
                                 phoneNumber: phone,
                                 password: password)
        )) { (response: RegisterResponse) in
            if response.code == 201, let registerVO = response.data, let token = response.data?.accessToken, !token.isEmpty {
                let user = UserVO.init(
                    userName: registerVO.userName ?? "",
                    email: registerVO.email ?? "",
                    phoneNumber: registerVO.phoneNumber ?? ""
                )
                onSuccess(token, user.toEntity())
            }
            else {
                onFailed(.UNKOWN("Something went wrong"))
            }
        } onFailed: { error in
            switch error {
            case let .UNEXPECTED_STATUS_CODE(code):
                if code == self.duplicateUserErrorCode {
                    onFailed(.DUPLICATE_USER)
                }
                else {
                    onFailed(.UNKOWN(error.customMessage))
                }
            default:
                onFailed(.UNKOWN(error.customMessage))
            }
        }

    }
}
