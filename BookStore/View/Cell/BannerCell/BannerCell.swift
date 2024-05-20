//
//  BannerCell.swift
//  BookStore
//
//  Created by Wai Thura Tun on 20/04/2024.
//

import UIKit

class BannerCell: UITableViewCell {
    
    @IBOutlet weak var cvBanner: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var data: SpecialBookVO? = nil {
        didSet {
            if let data = data {
                lblTitle.text = data.title
                cvBanner.reloadData()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cvBanner.register(UINib.init(nibName: "BannerItemCell", bundle: nil), forCellWithReuseIdentifier: "BannerItemCell")
        cvBanner.dataSource = self
        cvBanner.delegate = self
        cvBanner.contentInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        cvBanner.isPagingEnabled = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension BannerCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.books.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerItemCell", for: indexPath) as? BannerItemCell
        guard let cell = cell else { return UICollectionViewCell.init() }
        cell.data = data?.books[indexPath.row].bookCover
        return cell
    }
}

extension BannerCell: UICollectionViewDelegate {
    
}

extension BannerCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.width - 16 - 20 - 15, height: 181)
    }
}
