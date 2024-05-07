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
    func onNewUser()
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
        network.request(endPoint: .Login(LoginRequest.init(userName: userName!, password: password!))) { [weak self] (response: LoginResponse) in
            if response.code == 0 {
                if let token = response.data?.accessToken {
                    UserDefaults.setAccessToken(token: token)
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
            switch error {
            case .UNEXPECTED_STATUS_CODE(let code):
                if code == 404 {
                    self?.delegate.onNewUser()
                }
                else {
                    self?.delegate.onError(error: "Something went wrong")
                }
            default:
                self?.delegate.onError(error: "Something went wrong")
            }
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
