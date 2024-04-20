//
//  DynamicHeightCV.swift
//  BookStore
//
//  Created by Wai Thura Tun on 20/04/2024.
//

import Foundation
import UIKit

class DynamicHeightCV: UICollectionView {
    
    override func reloadData() {
        super.reloadData()
        self.layoutIfNeeded()
        self.invalidateIntrinsicContentSize()
    }
    
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return super.contentSize
    }
}
