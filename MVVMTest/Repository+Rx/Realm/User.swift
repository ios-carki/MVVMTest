//
//  User.swift
//  MVVMTest
//
//  Created by Carki on 2023/01/29.
//

import Foundation

import RealmSwift

final class User: Object {
    @Persisted var userNick: String
    @Persisted var userPW: String
    @Persisted var regDate = Date()
    @Persisted var age: String
    @Persisted var favorite = false
    
    @Persisted(primaryKey: true) var userID: ObjectId
    
    convenience init(userNick: String, userPW: String, regDate: Date, age: String, favorite: Bool) {
        self.init()
        self.userNick = userNick
        self.userPW = userPW
        self.regDate = regDate
        self.age = age
        self.favorite = favorite
    }
}
