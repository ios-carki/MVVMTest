//
//  SecondViewController.swift
//  MVVMTest
//
//  Created by Carki on 2023/01/29.
//

import UIKit

import RealmSwift
import RxCocoa
import RxSwift

final class SecondViewController: UIViewController {
    private let mainView = SecondView()
    private let viewModel = SecondViewModel()
    private let disposeBag = DisposeBag()
    
    deinit {
        print("두번째 뷰컨 메모리에서 내려감")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    private func bind() {
        mainView.saveButton.rx.tap
            .subscribe { [weak self] _ in
                self?.viewModel.writeUser(nick: self?.mainView.nickNameTextField.text ?? "NULL", passWord: self?.mainView.passWordTextField.text ?? "NULL", age: self?.mainView.ageTextField.text ?? "NULL")
            }
            .disposed(by: disposeBag)
        
        mainView.saveButton.rx.tap
            .withUnretained(self)
            .bind { (vc, _) in
                vc.navigationController?.popViewController(animated: true)
            }
            .disposed(by: disposeBag)
    }
}
