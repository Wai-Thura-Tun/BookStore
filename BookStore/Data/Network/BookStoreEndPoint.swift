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
    
    var path: String {
        switch self {
        case .Login:
            return "/auth/login"
        case .Register:
            return "/auth/register_user"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .Login, .Register:
            return .POST
        }
    }
    
    var header: [String : Any]? {
        switch self {
        case .Login, .Register:
            return nil
        }
    }
    
    var parameter: [String : Any]? {
        switch self {
        case let .Login(request), let .Register(request):
            return request.toDict()
        }
    }
    
    var encoding: HTTPEncoding {
        switch self {
        case .Login, .Register:
            return .JSON
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
