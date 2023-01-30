//
//  FirstViewCell.swift
//  MVVMTest
//
//  Created by Carki on 2023/01/29.
//

import UIKit

import SnapKit

final class FirstViewCell: BaseTableViewCell {
    static let identify = "mainCell"
    
    let userNickName: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.textColor = .black
        return view
    }()
    
    let regDate: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.textColor = .black
        return view
    }()
    
    let ageLable: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.textColor = .black
        return view
    }()
    
    override func configure() {
        [userNickName, regDate, ageLable].forEach {
            contentView.addSubview($0)
        }
        contentView.backgroundColor = .white
    }
    
    override func setConstraints() {
        let margin = 8
        
        userNickName.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(margin)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(margin)
            make.height.equalTo(20)
        }
        
        regDate.snp.makeConstraints { make in
            make.top.equalTo(userNickName.snp.bottom).offset(margin)
            make.leading.equalTo(safeAreaLayoutGuide).offset(margin)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-margin)
        }
        
        ageLable.snp.makeConstraints { make in
            make.top.equalTo(userNickName.snp.bottom).offset(margin)
            make.leading.equalTo(regDate.snp.trailing).offset(margin)
            make.trailing.bottom.equalTo(safeAreaLayoutGuide).offset(-margin)
            make.width.equalTo(30)
        }
    }
}
