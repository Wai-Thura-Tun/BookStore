//
//  LoginVC.swift
//  BookStore
//
//  Created by Wai Thura Tun on 28/04/2024.
//

import UIKit

class LoginVC: UIViewController, StoryBoarded {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPass: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    static var storyboardName: String = "Auth"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpBinding()
    }

    private func setUpBinding() {
        tfEmail.addCancelBarButton(target: self, action: #selector(onTapCancelEmail))
        tfPass.addCancelBarButton(target: self, action: #selector(onTapCancelPass))
    }
    
    @objc func onTapCancelEmail() {
        tfEmail.resignFirstResponder()
    }
    
    @objc func onTapCancelPass() {
        tfPass.resignFirstResponder()
    }
}
