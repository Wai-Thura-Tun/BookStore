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
    func onOldUser()
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
        network.request(endPoint: .Register(RegisterRequest.init(userName: userName!, email: email!, phoneNumber: phoneNumber!, password: password!))) { [weak self] (response: RegisterResponse) in
            if response.code == 201 {
                if let token = response.data?.accessToken {
                    UserDefaults.setAccessToken(token: token)
                    self?.delegate.onRegisterLogin()
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
                if code == 409 {
                    self?.delegate.onOldUser()
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
