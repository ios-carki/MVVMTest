//
//  SecondView.swift
//  MVVMTest
//
//  Created by Carki on 2023/01/29.
//

import UIKit

import SnapKit

final class SecondView: BaseView {
    
    let nickNameTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "닉네임을 입력하세요."
        view.textColor = .black
        view.font = .systemFont(ofSize: 18)
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    let passWordTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "비밀번호를 입력하세요."
        view.textColor = .black
        view.font = .systemFont(ofSize: 18)
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    let ageTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "나이를 입력하세요."
        view.textColor = .black
        view.font = .systemFont(ofSize: 18)
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    let todayLabel: UILabel = {
        let view = UILabel()
        view.text = "오늘날짜"
        view.textColor = .black
        view.font = .systemFont(ofSize: 18)
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    let saveButton: UIButton = {
        let view = UIButton()
        view.setTitle("저장", for: .normal)
        view.backgroundColor = .lightGray
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    override func configureUI() {
        [nickNameTextField, passWordTextField, ageTextField, todayLabel, saveButton].forEach {
            self.addSubview($0)
        }
        self.backgroundColor = .white
    }
    
    override func setConstraints() {
        let viewHeight = 30
        
        nickNameTextField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(viewHeight)
        }
        
        passWordTextField.snp.makeConstraints { make in
            make.top.equalTo(nickNameTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(viewHeight)
        }
        
        ageTextField.snp.makeConstraints { make in
            make.top.equalTo(passWordTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(viewHeight)
        }
        
        todayLabel.snp.makeConstraints { make in
            make.top.equalTo(ageTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(ageTextField.snp.height)
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(todayLabel.snp.bottom).offset(40)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
    }
}
