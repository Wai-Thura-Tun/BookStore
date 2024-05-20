//
//  BookStoreRequestInterceptor.swift
//  BookStore
//
//  Created by Wai Thura Tun on 20/05/2024.
//

import Foundation
import Alamofire

class BookStoreRequestInterceptor: RequestInterceptor {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, any Error>) -> Void) {
        var request = urlRequest
        let path: String? = request.url?.path(percentEncoded: false).replacingOccurrences(of: "/api", with: "")
        if let path = path {
            switch path {
            case BookStoreEndPoint.Login(0).path, BookStoreEndPoint.Register(0).path:
                break
            default:
                if let token = KeychainManager.shared.getAccessToken(), !token.isEmpty {
                    request.headers.add(.authorization(bearerToken: token))
                }
            }
        }
        completion(.success(request))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: any Error, completion: @escaping (RetryResult) -> Void) {
        if request.response?.statusCode == 401 {
            NotificationCenter.default.post(name: .TokenExpiredNotification, object: nil)
        }
        completion(.doNotRetry)
    }
}
