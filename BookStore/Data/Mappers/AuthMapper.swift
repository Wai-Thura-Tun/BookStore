//
//  AuthMapper.swift
//  BookStore
//
//  Created by Wai Thura Tun on 26/05/2024.
//

import Foundation

extension UserEntity {
    func toVO() -> UserVO {
        return UserVO.init(
            userName: self.userName,
            email: self.email,
            phoneNumber: self.phoneNumber
        )
    }
}

extension UserVO {
    func toEntity() -> UserEntity {
        let userEntity = UserEntity()
        userEntity.userName = self.userName
        userEntity.email = self.email
        userEntity.phoneNumber = self.phoneNumber
        return userEntity
    }
}
