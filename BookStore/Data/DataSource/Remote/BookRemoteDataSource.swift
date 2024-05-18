//
//  BookRemoteDataSource.swift
//  BookStore
//
//  Created by Wai Thura Tun on 15/05/2024.
//

import Foundation

class BookRemoteDataSource {
    private let network: NetworkManager = .shared
    
    func getBooks(
        onSuccess: @escaping ([HomeData]) -> (),
        onFailed: @escaping (String) -> ()
    ) {
        network.request(endPoint: .GetBooks) { (response: BookListResponse) in
            let specialBooks: [SpecialBookVO] = response.data?.specialBooks ?? []
            let normalBooks: [BookVO] = response.data?.normalBooks ?? []
            var homeData: [HomeData] = []
            homeData.append(contentsOf: specialBooks)
            homeData.append(contentsOf: normalBooks)
            onSuccess(homeData)
        } onFailed: { error in
            onFailed(error.customMessage)
        }
    }
}
