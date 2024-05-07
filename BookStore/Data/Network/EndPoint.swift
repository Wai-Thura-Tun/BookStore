//
//  EndPoint.swift
//  BookStore
//
//  Created by Wai Thura Tun on 06/05/2024.
//

import Foundation

protocol EndPoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var header: [String : Any]? { get }
    var parameter: [String : Any]? { get }
    var encoding: HTTPEncoding { get }
    
    func asURL() throws -> URL
}

extension EndPoint {
    var baseURL: URL {
        URL(string: Bundle.main.infoDictionary?["BASE_URL"] as? String ?? "")!
    }
    
    func asURL() throws -> URL {
        return baseURL.appending(path: path)
    }
}
