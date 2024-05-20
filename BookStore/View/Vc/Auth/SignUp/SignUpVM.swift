//
//  RegisterVM.swift
//  BookStore
//
//  Created by Wai Thura Tun on 02/05/2024.
//

import Foundation

protocol SignUpViewDelegate {
    func onValidate(validationErrors: [SignUpVM.FormInput])
    func onError(error: String)
    func onSignUpSuccess()
    func onOldUser()
}

class SignUpVM {
    
    enum FormInput {
        case UserNameTextField(String)
        case EmailTextField(String)
        case PhoneNumberTextField(String)
        case PasswordTextField(String)
    }
    
    private let delegate: SignUpViewDelegate
    private let repository: AuthRepository = .init()
    
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
    
    init(delegate: SignUpViewDelegate) {
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
    
    func signUp() {
        repository.signUp(username: userName!, email: email!, phone: phoneNumber!, password: password!) { [weak self] in
            self?.delegate.onSignUpSuccess()
        } onFailed: { [weak self] error in
            switch error {
            case .DUPLICATE_USER:
                self?.delegate.onOldUser()
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
