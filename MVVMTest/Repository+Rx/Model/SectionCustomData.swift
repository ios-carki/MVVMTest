//
//  SectionCustomData.swift
//  MVVMTest
//
//  Created by Carki on 2023/01/29.
//

import Foundation

import RxDataSources

struct SectionCustomData {
    var items: [Item]
}

extension SectionCustomData: SectionModelType {
    typealias Item = User
    
    init(original: SectionCustomData, items: [User]) {
        self = original
        self.items = items
    }
}
