//
//  AuthLocalDataSource.swift
//  BookStore
//
//  Created by Wai Thura Tun on 26/05/2024.
//

import Foundation
import RealmSwift

class AuthLocalDataSource {
    
    private let realm: Realm
    static let shared: AuthLocalDataSource = .init()
    
    private init() {
        self.realm = try! Realm()
    }
    
    func saveUser(with user: UserEntity) throws {
        try realm.write {
            realm.add(user.self, update: .all)
        }
    }
    
    func getUser() -> UserVO? {
        if let user = realm.object(ofType: UserEntity.self, forPrimaryKey: 1) {
            return user.toVO()
        }
        return nil
    }
    
    func deleteUser() {
        if let user = realm.object(ofType: UserEntity.self, forPrimaryKey: 1) {
            realm.delete(user)
        }
    }
}
