//
//  NetworkManager.swift
//  BookStore
//
//  Created by Wai Thura Tun on 28/04/2024.
//

import Foundation

class NetworkManager {
    
    static let shared: NetworkManager = .init()
    
    private init() {}
    
    func request<T: Codable>(
        endPoint: BookStoreEndPoint,
        onSuccess: @escaping (T) -> Void,
        onFailed: @escaping (NetworkError) -> Void
    ) {
        let url = try? endPoint.asURL()
        
        guard let url = url else {
            onFailed(.INVALID_URL)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let token = UserDefaults.getAccessToken(), !token.isEmpty {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        if let requestBody = endPoint.parameter {
            switch endPoint.encoding {
            case .JSON:
                let data = try? JSONSerialization.data(withJSONObject: requestBody)
                request.httpBody = data
            case .QUERY_STRING:
                request.url?.append(queryItems: requestBody.map {
                    URLQueryItem(name: $0.key, value: $0.value as? String)
                })
            }
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                onFailed(.UNKNOWN)
            }
            else {
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    if (200..<300) ~= statusCode {
                        if let data = data {
                            let object = try? JSONDecoder().decode(T.self, from: data)
                            if let object = object {
                                onSuccess(object)
                            }
                            else {
                                onFailed(.DECODE_ERROR)
                            }
                        }
                        else {
                            onFailed(.EMPTY_RESPONSE)
                        }
                    }
                    else {
                        onFailed(.UNEXPECTED_STATUS_CODE(statusCode))
                    }
                }
                else {
                    onFailed(.EMPTY_RESPONSE)
                }
            }
        }.resume()
    }
}
