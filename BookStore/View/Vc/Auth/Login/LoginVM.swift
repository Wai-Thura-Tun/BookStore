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
    private let repository: AuthRepository = .init()
    
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
        repository.login(username: userName!, password: password!) { [weak self] in
            self?.delegate.onLoginSuccess()
        } onFailed: { [weak self] error in
            switch error {
            case .NEW_USER:
                self?.delegate.onNewUser()
            case .UNKOWN(let error):
                self?.delegate.onError(error: error)
            default:
                break
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
