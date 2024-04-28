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
    
    func fetchData<T: Codable>(
        url: URL,
        method: String = "GET",
        contentType: String = "application/json",
        onSuccess: @escaping (T) -> Void,
        onFailed: @escaping (String) -> Void
    ) {
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                onFailed(error.localizedDescription)
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
                                onFailed("Cannot parse response data")
                            }
                        }
                        else {
                            onFailed("Response data empty")
                        }
                    }
                    else {
                        onFailed("Status Code : \(statusCode)")
                    }
                }
                else {
                    onFailed("Invalid Status Code")
                }
            }
        }.resume()
    }
}
