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
    
    private func checkUserLoginStatus() {
        if UserDefaults.getAccessToken() != nil {
            let vc = BookListVC.instantiate()
            pushViewController(vc, animated: true)
        }
        else {
            let vc = LoginVC.instantiate()
            setViewControllers([vc], animated: true)
        }
    }

}
