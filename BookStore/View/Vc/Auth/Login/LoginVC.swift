//
//  LoginVC.swift
//  BookStore
//
//  Created by Wai Thura Tun on 28/04/2024.
//

import UIKit

class LoginVC: UIViewController, StoryBoarded {

    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var lblUserNameError: UILabel!
    @IBOutlet weak var lblPasswordError: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    
    static var storyboardName: String = "Auth"
    
    private lazy var vm: LoginVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBinding()
    }
    
    private func setUpViews() {
        
    }

    private func setUpBinding() {
        tfUserName.addCancelBarButton(target: self, action: #selector(onTapCancelEmail))
        tfPassword.addCancelBarButton(target: self, action: #selector(onTapCancelPass))
        tfUserName.addTarget(self, action: #selector(onChangeUserName), for: .editingChanged)
        tfPassword.addTarget(self, action: #selector(onChangePassword), for: .editingChanged)
        btnLogin.addTarget(self, action: #selector(onTapLogin), for: .touchUpInside)
        btnRegister.addTarget(self, action: #selector(onTapRegister), for: .touchUpInside)
    }
    
    @objc func onTapCancelEmail() {
        tfUserName.resignFirstResponder()
    }
    
    @objc func onTapCancelPass() {
        tfPassword.resignFirstResponder()
    }
    
    @objc func onChangeUserName() {
        vm.setUserName(userName: tfUserName.text)
    }
    
    @objc func onChangePassword() {
        vm.setPassword(password: tfPassword.text)
    }
    
    @objc func onTapLogin() {
        vm.login()
    }
    
    @objc func onTapRegister() {
        let vc = RegisterVC.instantiate()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func resetError() {
        lblUserNameError.isHidden = true
        lblPasswordError.isHidden = true
    }
    
    private func setError(with label: UILabel, and message: String) {
        label.isHidden = false
        label.text = message
    }
}

extension LoginVC: LoginViewDelegate {
    func onValidate(validationErrors: [LoginVM.FormInput]) {
        if validationErrors.isEmpty {
            btnLogin.isEnabled = true
            resetError()
        }
        else {
            btnLogin.isEnabled = false
            resetError()
            validationErrors.forEach { inputType in
                switch inputType {
                case .UserNameTextField(let message):
                    setError(with: lblUserNameError, and: message)
                case .PasswordTextField(let message):
                    setError(with: lblPasswordError, and: message)
                }
            }
        }
    }
    
    func onError(error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.showError(error: error)
        }
    }
    
    func onLoginSuccess() {
        DispatchQueue.main.async { [weak self] in
            let vc = BookListVC.instantiate()
            self?.navigationController?.pushViewController(vc, animated: true)
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
