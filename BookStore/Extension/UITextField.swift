//
//  Array.swift
//  BookStore
//
//  Created by Wai Thura Tun on 28/04/2024.
//

import Foundation
import UIKit

extension UITextField {
    func addCancelBarButton(target: Any, action selector: Selector) {
        let toolbar = UIToolbar.init()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.sizeToFit()
        
        let cancelBtn = UIBarButtonItem.init(
            title: "Cancel",
            style: .plain,
            target: target,
            action: selector)
        
        toolbar.setItems([cancelBtn], animated: true)
        self.inputAccessoryView = toolbar
    }
}
