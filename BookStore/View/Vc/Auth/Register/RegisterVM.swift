//
//  RegisterVM.swift
//  BookStore
//
//  Created by Wai Thura Tun on 02/05/2024.
//

import Foundation

protocol RegisterViewDelegate {
    func onValidate(validationErrors: [RegisterVM.FormInput])
    func onError(error: String)
    func onRegisterLogin()
}

class RegisterVM {
    
    enum FormInput {
        case UserNameTextField(String)
        case EmailTextField(String)
        case PhoneNumberTextField(String)
        case PasswordTextField(String)
    }
    
    private let delegate: RegisterViewDelegate
    private let network: NetworkManager = .shared
    
    private var userName: String? {
        didSet {
            validate()
        }
    }
    
    private var email: String? {
        didSet {
            validate()
        }
    }
    
    private var phoneNumber: String? {
        didSet {
            validate()
        }
    }
    
    private var password: String? {
        didSet {
            validate()
        }
    }
    
    init(delegate: RegisterViewDelegate) {
        self.delegate = delegate
    }
    
    func setUserName(userName: String?) {
        self.userName = userName
    }
    
    func setEmail(email: String?) {
        self.email = email
    }
    
    func setPhoneNumber(phoneNumber: String?) {
        self.phoneNumber = phoneNumber
    }
    
    func setPassword(password: String?) {
        self.password = password
    }
    
    func register() {
        let requestBody: RegisterRequest = .init(userName: userName!, email: email!, phoneNumber: phoneNumber!, password: password!)
        let url = URL(string: "http://54.179.102.152/api/auth/register_user")!
        network.fetchData(url: url,
                          method: "POST",
                          requestBody: requestBody) { [weak self] (response: RegisterResponse) in
            if response.code == 201 {
                if let accessToken = response.data?.accessToken {
                    UserDefaults.setAccessToken(token: accessToken)
                    self?.delegate.onRegisterLogin()
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
        
        if email == nil || email == "" {
            errors.append(.EmailTextField("* Email is required."))
        }
        
        if phoneNumber == nil || phoneNumber == "" {
            errors.append(.PhoneNumberTextField("* Phone Number is required."))
        }
        
        if password == nil || password == "" {
            errors.append(.PasswordTextField("* Password is required."))
        }
        
        delegate.onValidate(validationErrors: errors)
    }
}
