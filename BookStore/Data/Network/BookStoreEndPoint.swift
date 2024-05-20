//
//  BookStoreEndPoint.swift
//  BookStore
//
//  Created by Wai Thura Tun on 06/05/2024.
//

import Foundation
import Alamofire

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
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .Login, .Register:
            return .post
        case .GetBooks:
            return .get
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .Login, .Register, .GetBooks:
            return nil
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case let .Login(request), let .Register(request):
            return request.toDict()
        case .GetBooks:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .Login, .Register:
            return JSONEncoding.default
        case .GetBooks:
            return URLEncoding.default
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
