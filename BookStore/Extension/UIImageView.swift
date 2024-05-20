//
//  UIImageView.swift
//  BookStore
//
//  Created by Wai Thura Tun on 20/05/2024.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(
        url: String?,
        cornerRadius: CGFloat = 10,
        isAddLoading: Bool = false,
        animateDuration: TimeInterval = 1
    ) {
        guard let url = url else { return }
        let imageURL = URL(string: url)
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
                    |> RoundCornerImageProcessor(cornerRadius: cornerRadius)
        self.kf.indicatorType = isAddLoading ? .activity : .none
        self.kf.setImage(with: imageURL, options: [
            .processor(processor),
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .cacheOriginalImage
        ])
    }
}
