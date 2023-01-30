//
//  FirstViewModel.swift
//  MVVMTest
//
//  Created by Carki on 2023/01/29.
//
import Foundation

import RxSwift
import RxCocoa
import RxDataSources

final class FirstViewModel {
    let list = PublishSubject<User>()
    let userList = PublishSubject<[SectionCustomData]>()
    let realmRepository = UserRepository()
    
    func insertData() {
        let data = realmRepository.fetchSort(dataName: "regDate", ascending: false)
        let arr = Array(data)
        let x = SectionCustomData(items: arr)
        userList.onNext([x])
    }
    
    func setDateFormat(date: Date) -> String {
        let dateFormat: DateFormatter = {
            let format = DateFormatter()
            format.locale = Locale(identifier: "ko_KR")
            format.dateFormat = "yyyy년 MM월 dd일"
            return format
        }()
        
        return dateFormat.string(from: date)
    }
}
