//
//  BannerItemCell.swift
//  BookStore
//
//  Created by Wai Thura Tun on 20/04/2024.
//

import UIKit

class BannerItemCell: UICollectionViewCell {

    @IBOutlet weak var imgBookCover: UIImageView!
    
    var data: BookVO? = nil {
        didSet {
            if let data = data {
                imgBookCover.sd_setImage(with: URL(string: data.bookCover ?? ""))
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
