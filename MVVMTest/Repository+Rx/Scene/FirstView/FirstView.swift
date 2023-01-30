//
//  FirstView.swift
//  MVVMTest
//
//  Created by Carki on 2023/01/29.
//

import UIKit

import SnapKit

final class FirstView: BaseView {
    
    let dataTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .white
        view.rowHeight = 100
        return view
    }()
    
    override func configureUI() {
        self.addSubview(dataTableView)
        self.backgroundColor = .white
    }
    
    override func setConstraints() {
        
        dataTableView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
}
