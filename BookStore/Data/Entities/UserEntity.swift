//
//  UserEntity.swift
//  BookStore
//
//  Created by Wai Thura Tun on 26/05/2024.
//

import Foundation
import RealmSwift

class UserEntity: Object {
    @Persisted(primaryKey: true) var id: Int = 1
    @Persisted var userName: String = ""
    @Persisted var email: String = ""
    @Persisted var phoneNumber: String = ""
}
