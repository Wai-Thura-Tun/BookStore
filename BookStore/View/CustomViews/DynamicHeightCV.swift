//
//  DynamicHeightCV.swift
//  BookStore
//
//  Created by Wai Thura Tun on 20/04/2024.
//

import Foundation
import UIKit

class DynamicHeightCV: UICollectionView {
    var maxHeight = CGFloat.greatestFiniteMagnitude
    
    override var intrinsicContentSize: CGSize {
        setNeedsLayout()
        layoutIfNeeded()
        
        let height = min(contentSize.height, maxHeight)
        return .init(width: UIScreen.main.bounds.width, height: height)
    }
    
    override func reloadData() {
        super.reloadData()
        invalidateIntrinsicContentSize()
        layoutIfNeeded()
    }
}
