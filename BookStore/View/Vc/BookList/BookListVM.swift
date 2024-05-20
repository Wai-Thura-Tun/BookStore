//
//  BookListVM.swift
//  BookStore
//
//  Created by Wai Thura Tun on 16/05/2024.
//

import Foundation

protocol BookListViewDelegate {
    func onError(error: String)
    func onListLoaded()
}

class BookListVM {
    private let repository: BookRepository = .init()
    
    private let delegate: BookListViewDelegate
    
    init(delegate: BookListViewDelegate) {
        self.delegate = delegate
    }
    
    private(set) var homeData: [HomeData] = [] {
        didSet {
            delegate.onListLoaded()
        }
    }
    
    func getBooks() {
        repository.getBooks { [weak self] data in
            self?.homeData = data
        } onFailed: { [weak self] error in
            self?.delegate.onError(error: error)
        }
    }
}
