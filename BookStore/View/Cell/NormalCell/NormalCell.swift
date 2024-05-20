//
//  NormalCell.swift
//  BookStore
//
//  Created by Wai Thura Tun on 20/04/2024.
//

import UIKit

class NormalCell: UITableViewCell {
    
    @IBOutlet weak var imgBookCover: UIImageView!
    @IBOutlet weak var lblBookTitle: UILabel!
    @IBOutlet weak var lblBookAuthor: UILabel!
    
    var data: BookVO? = nil {
        didSet {
            if let data = data {
                imgBookCover.sd_setImage(with: URL(string: data.bookCover ?? ""))
                lblBookTitle.text = data.name
                lblBookAuthor.text = data.author?.name
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
}
