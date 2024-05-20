//
//  RootNC.swift
//  BookStore
//
//  Created by Wai Thura Tun on 28/04/2024.
//

import UIKit

class RootNC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        checkUserLoginStatus()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTokenExpired), name: .TokenExpiredNotification, object: nil)
    }
    
    @objc func handleTokenExpired() {
        KeychainManager.shared.deleteAccessToken()
        DispatchQueue.main.async { [weak self] in
            self?.checkUserLoginStatus()
        }
    }
    
    private func checkUserLoginStatus() {
        if KeychainManager.shared.getAccessToken() != nil {
            let vc = BookListVC.instantiate()
            pushViewController(vc, animated: true)
        }
        else {
            let vc = LoginVC.instantiate()
            setViewControllers([vc], animated: true)
        }
    }

}
