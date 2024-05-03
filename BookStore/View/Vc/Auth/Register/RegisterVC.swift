//
//  RegisterVC.swift
//  BookStore
//
//  Created by Wai Thura Tun on 02/05/2024.
//

import UIKit

class RegisterVC: UIViewController, StoryBoarded {

    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var lblUserNameError: UILabel!
    @IBOutlet weak var lblEmailError: UILabel!
    @IBOutlet weak var lblPhoneNoError: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    
    static var storyboardName: String = "Auth"
    
    private lazy var vm: RegisterVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBindings()
    }
    
    private func setUpViews() {
        
    }

    private func setUpBindings() {
        
        // Add Cancel Bar Button To Keyboard for every text field
        tfUserName.addCancelBarButton(target: self, action: #selector(onTapCancelUserName))
        tfEmail.addCancelBarButton(target: self, action: #selector(onTapCancelEmail))
        tfPhoneNumber.addCancelBarButton(target: self, action: #selector(onTapCancelPhoneNo))
        tfPassword.addCancelBarButton(target: self, action: #selector(onTapCancelPassword))
        
        // Change event
        tfUserName.addTarget(self, action: #selector(onChangeUserName), for: .editingChanged)
        tfEmail.addTarget(self, action: #selector(onChangeEmail), for: .editingChanged)
        tfPhoneNumber.addTarget(self, action: #selector(onChangePhoneNumber), for: .editingChanged)
        tfPassword.addTarget(self, action: #selector(onChangePassword), for: .editingChanged)
        
        // Click event for
        btnRegister.addTarget(self, action: #selector(onTapRegister), for: .touchUpInside)
        btnLogin.addTarget(self, action: #selector(onTapLogin), for: .touchUpInside)
    }
    
    @objc func onTapCancelUserName() {
        tfUserName.resignFirstResponder()
    }
    
    @objc func onTapCancelEmail() {
        tfEmail.resignFirstResponder()
    }
    
    @objc func onTapCancelPhoneNo() {
        tfPhoneNumber.resignFirstResponder()
    }
    
    @objc func onTapCancelPassword() {
        tfPassword.resignFirstResponder()
    }
    
    @objc func onChangeUserName() {
        vm.setUserName(userName: tfUserName.text)
    }
    
    @objc func onChangeEmail() {
        vm.setEmail(email: tfEmail.text)
    }
    
    @objc func onChangePhoneNumber() {
        vm.setPhoneNumber(phoneNumber: tfPhoneNumber.text)
    }
    
    @objc func onChangePassword() {
        vm.setPassword(password: tfPassword.text)
    }
    
    @objc func onTapLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func onTapRegister() {
        vm.register()
    }
    
    private func resetError() {
        lblUserNameError.isHidden = true
        lblEmailError.isHidden = true
        lblPhoneNoError.isHidden = true
        lblPassword.isHidden = true
    }
    
    private func setError(with label: UILabel, and message: String) {
        label.isHidden = false
        label.text = message
    }
}

extension RegisterVC: RegisterViewDelegate {
    func onValidate(validationErrors: [RegisterVM.FormInput]) {
        if validationErrors.isEmpty {
            btnRegister.isEnabled = true
            resetError()
        }
        else {
            btnRegister.isEnabled = false
            resetError()
            validationErrors.forEach { inputType in
                switch inputType {
                case .UserNameTextField(let message):
                    setError(with: lblUserNameError, and: message)
                case .EmailTextField(let message):
                    setError(with: lblEmailError, and: message)
                case .PhoneNumberTextField(let message):
                    setError(with: lblPhoneNoError, and: message)
                case .PasswordTextField(let message):
                    setError(with: lblPassword, and: message)
                }
            }
        }
    }
    
    func onError(error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.showError(error: error)
        }
    }
    
    func onRegisterLogin() {
        DispatchQueue.main.async { [weak self] in
            let vc = BookListVC.instantiate()
            self?.navigationController?.setViewControllers([vc], animated: true)
        }
    }
    
    private func showError(error message: String) {
        let alertController = UIAlertController.init(title: "Error",
                                                     message: message,
                                                     preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}


