//
//  BookListVC.swift
//  BookStore
//
//  Created by Wai Thura Tun on 20/04/2024.
//

import UIKit

class BookListVC: UIViewController {

    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var tbBookList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBindings()
    }
    
    private func setUpViews() {
        imgUser.layer.cornerRadius = imgUser.frame.width / 2
        tbBookList.register(UINib.init(nibName: "NormalCell", bundle: nil), forCellReuseIdentifier: "NormalCell")
        tbBookList.register(UINib.init(nibName: "CarouselCell", bundle: nil), forCellReuseIdentifier: "CarouselCell")
        tbBookList.register(UINib.init(nibName: "BannerCell", bundle: nil), forCellReuseIdentifier: "BannerCell")
        tbBookList.register(UINib.init(nibName: "GridCell", bundle: nil), forCellReuseIdentifier: "GridCell")
        tbBookList.dataSource = self
        tbBookList.delegate = self
        tbBookList.separatorStyle = .none
    }
    
    private func setUpBindings() {
        
    }
}

extension BookListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as? BannerCell
            guard let cell = cell else { return  UITableViewCell.init() }
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CarouselCell", for: indexPath) as? CarouselCell
            guard let cell = cell else { return  UITableViewCell.init() }
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GridCell", for: indexPath) as? GridCell
            guard let cell = cell else { return UITableViewCell.init() }
            return cell
        }
        else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CarouselCell", for: indexPath) as? CarouselCell
            guard let cell = cell else { return  UITableViewCell.init() }
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NormalCell") as? NormalCell
            guard let cell = cell else { return UITableViewCell.init() }
            return cell
        }
    }
}

extension BookListVC: UITableViewDelegate {
    
}
