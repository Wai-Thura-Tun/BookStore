//
//  BookRepository.swift
//  BookStore
//
//  Created by Wai Thura Tun on 16/05/2024.
//

import Foundation

class BookRepository {
    private let bookRemoteDataSource: BookRemoteDataSource = .init()
    
    func getBooks(
        onSuccess: @escaping ([HomeData]) -> (),
        onFailed: @escaping (String) -> ()
    ) {
        bookRemoteDataSource.getBooks(onSuccess: onSuccess, onFailed: onFailed)
    }
}
