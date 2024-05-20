//
//  BookListVC.swift
//  BookStore
//
//  Created by Wai Thura Tun on 20/04/2024.
//

import UIKit

class BookListVC: UIViewController, StoryBoarded {

    enum CellType: String {
        case BANNER
        case CAROUSEL
        case GRID
    }
    
    static var storyboardName: String = "Home"
    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var tbBookList: UITableView!
    
    private lazy var vm: BookListVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBindings()
        vm.getBooks()
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
        return vm.homeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = vm.homeData[indexPath.row]
        if let data = data as? SpecialBookVO, let type = data.type {
            switch type {
            case CellType.BANNER.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as? BannerCell
                guard let cell = cell else { return  UITableViewCell.init() }
                cell.data = data
                return cell
            case CellType.CAROUSEL.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: "CarouselCell", for: indexPath) as? CarouselCell
                guard let cell = cell else { return  UITableViewCell.init() }
                cell.data = data
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "GridCell", for: indexPath) as? GridCell
                guard let cell = cell else { return UITableViewCell.init() }
                cell.data = data
                return cell
            }
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NormalCell") as? NormalCell
            guard let cell = cell else { return UITableViewCell.init() }
            cell.data = data as? BookVO
            return cell
        }
    }
}

extension BookListVC: UITableViewDelegate {
    
}

extension BookListVC: BookListViewDelegate {
    func onError(error: String) {
        showError(error: error)
    }
    
    func onListLoaded() {
        DispatchQueue.main.async { [weak self] in
            self?.tbBookList.reloadData()
        }
    }
    
    private func showError(error message: String) {
        let alertController = UIAlertController(title: "Error",
                                                message: message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
