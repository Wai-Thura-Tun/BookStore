//
//  GridCell.swift
//  BookStore
//
//  Created by Wai Thura Tun on 20/04/2024.
//

import UIKit

class GridCell: UITableViewCell {

    @IBOutlet weak var cvGrid: DynamicHeightCV!
    @IBOutlet weak var lblTitle: UILabel!
    
    var data: SpecialBookVO? {
        didSet {
            if let data = data {
                lblTitle.text = data.title
                cvGrid.reloadData()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cvGrid.register(UINib.init(nibName: "GridItemCell", bundle: nil), forCellWithReuseIdentifier: "GridItemCell")
        cvGrid.dataSource = self
        cvGrid.delegate = self
        cvGrid.contentInset = .init(top: 0, left: 20, bottom: 0, right: 20)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension GridCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.books.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridItemCell", for: indexPath) as? GridItemCell
        guard let cell = cell else { return UICollectionViewCell.init() }
        cell.data = data?.books[indexPath.row]
        return cell
    }
}

extension GridCell: UICollectionViewDelegate {
    
}

extension GridCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpace = 16 + collectionView.contentInset.left + collectionView.contentInset.right
        let calculatedWidth = collectionView.bounds.width - totalSpace
        return CGSize.init(width: calculatedWidth / 2, height: 268)
    }
}
