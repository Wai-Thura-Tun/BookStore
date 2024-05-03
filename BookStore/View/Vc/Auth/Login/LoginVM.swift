//
//  LoginVM.swift
//  BookStore
//
//  Created by Wai Thura Tun on 02/05/2024.
//

import Foundation

protocol LoginViewDelegate {
    func onValidate(validationErrors: [LoginVM.FormInput])
    func onError(error: String)
    func onLoginSuccess()
}

class LoginVM {
    
    enum FormInput {
        case UserNameTextField(String)
        case PasswordTextField(String)
    }
    
    private let delegate: LoginViewDelegate
    private let network: NetworkManager = .shared
    
    private var userName: String? {
        didSet {
            validate()
        }
    }
    
    private var password: String? {
        didSet {
            validate()
        }
    }
    
    init(delegate: LoginViewDelegate) {
        self.delegate = delegate
    }
    
    func setUserName(userName: String?) {
        self.userName = userName
    }
    
    func setPassword(password: String?) {
        self.password = password
    }
    
    func login() {
        let url = URL(string: "http://54.179.102.152/api/auth/login")!
        let requestBody: LoginRequest = .init(userName: userName!, password: password!)
        network.fetchData(url: url,
                          method: "POST",
                          requestBody: requestBody) { [weak self] (response: LoginResponse) in
            if response.code == 0 {
                if let accessToken = response.data?.accessToken {
                    UserDefaults.setAccessToken(token: accessToken)
                    self?.delegate.onLoginSuccess()
                }
                else {
                    self?.delegate.onError(error: "Something went wrong")
                }
            }
            else {
                self?.delegate.onError(error: response.message ?? "Something went wrong")
            }
        } onFailed: { [weak self] error in
            self?.delegate.onError(error: error)
        }

    }
    
    private func validate() {
        var errors: [FormInput] = []
        if userName == nil || userName == "" {
            errors.append(.UserNameTextField("* Username is required."))
        }
        
        if password == nil || password == "" {
            errors.append(.PasswordTextField("* Password is required."))
        }
        self.delegate.onValidate(validationErrors: errors)
    }
}
