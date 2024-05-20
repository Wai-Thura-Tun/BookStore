//
//  CarouselItemCell.swift
//  BookStore
//
//  Created by Wai Thura Tun on 20/04/2024.
//

import UIKit

class CarouselItemCell: UICollectionViewCell {
    
    @IBOutlet weak var imgBookCover: UIImageView!
    @IBOutlet weak var lblBookTitle: UILabel!
    @IBOutlet weak var lblBookAuthor: UILabel!
    
    var data: BookVO? = nil {
        didSet {
            if let data = data {
                imgBookCover.setImage(url: data.bookCover, isAddLoading: true)
                lblBookTitle.text = data.name
                lblBookAuthor.text = data.author?.name
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
