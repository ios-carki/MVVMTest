//
//  SecondViewModel.swift
//  MVVMTest
//
//  Created by Carki on 2023/01/29.
//

import Foundation

import RxSwift

final class SecondViewModel {
    let list = PublishSubject<User>()
    var user: User!
    private let userRepository = UserRepository()
    
    func fetch() {
        guard let user else { return }
        list.onNext(user)
    }
    
    func writeUser(nick: String, passWord: String, age: String) {
        userRepository.addUser(nick: nick, passWord: passWord, age: age)
    }
}
