//
//  UserRepository.swift
//  MVVMTest
//
//  Created by Carki on 2023/01/29.
//

import Foundation

import RealmSwift

final class UserRepository {
    let localRealm = try! Realm()
    
    @discardableResult
    func fetchSort(dataName: String, ascending: Bool) -> Results<User> {
        print("패치 성공")
        return localRealm.objects(User.self).sorted(byKeyPath: dataName, ascending: ascending)
    }
    
    func updateFavorite(user: User) {
        do {
            try localRealm.write {
                user.favorite = !user.favorite
            }
        } catch {
            print("즐겨찾기 등록 실패 🔴🔴🔴", #function)
        }
    }
    
    func addUser(nick: String, passWord: String, age: String) {
        do {
            try localRealm.write {
                let user = User(userNick: nick, userPW: passWord, regDate: Date(), age: age, favorite: false)
                localRealm.add(user)
            }
        } catch {
            print("유저 데이터 저장 실패 🔴🔴🔴", #function)
        }
    }
}
