//
//  GridItemCell.swift
//  BookStore
//
//  Created by Wai Thura Tun on 20/04/2024.
//

import UIKit

class GridItemCell: UICollectionViewCell {

    @IBOutlet weak var imgBookCover: UIImageView!
    
    var data: String? = nil {
        didSet {
            imgBookCover.setImage(url: data, isAddLoading: true)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
