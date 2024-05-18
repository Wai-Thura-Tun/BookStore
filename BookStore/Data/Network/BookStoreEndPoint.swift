//
//  BookStoreEndPoint.swift
//  BookStore
//
//  Created by Wai Thura Tun on 06/05/2024.
//

import Foundation

enum BookStoreEndPoint: EndPoint {
    
    case Login(Encodable)
    case Register(Encodable)
    case GetBooks
    
    var path: String {
        switch self {
        case .Login:
            return "/auth/login"
        case .Register:
            return "/auth/register_user"
        case .GetBooks:
            return "/user/books"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .Login, .Register:
            return .POST
        case .GetBooks:
            return .GET
        }
    }
    
    var header: [String : Any]? {
        switch self {
        case .Login, .Register, .GetBooks:
            return nil
        }
    }
    
    var parameter: [String : Any]? {
        switch self {
        case let .Login(request), let .Register(request):
            return request.toDict()
        case .GetBooks:
            return nil
        }
    }
    
    var encoding: HTTPEncoding {
        switch self {
        case .Login, .Register:
            return .JSON
        case .GetBooks:
            return .QUERY_STRING
        }
    }
}

extension Encodable {
    func toDict() -> [String: Any] {
        do {
            let requestData = try JSONEncoder().encode(self)
            let requestDict = try JSONSerialization.jsonObject(with: requestData, options: .allowFragments) as? [String: Any]
            return requestDict ?? [:]
        }
        catch {
            return [:]
        }
    }
}
