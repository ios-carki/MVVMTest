//
//  FirstViewController.swift
//  MVVMTest
//
//  Created by Carki on 2023/01/29.
//

import UIKit

import RxSwift
import RxCocoa
import RxDataSources

final class FirstViewController: UIViewController {
    private let mainView = FirstView()
    private let viewModel = FirstViewModel()
    private let disposeBag = DisposeBag()
    private let realmRepository = UserRepository()
    
    lazy var dataSource = RxTableViewSectionedReloadDataSource<SectionCustomData> { (dataSource, tableView, indexPath, item) in
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstViewCell.identify, for: indexPath) as? FirstViewCell else { return UITableViewCell() }
        cell.userNickName.text = item.userNick
        cell.regDate.text = self.viewModel.setDateFormat(date: Date())
        cell.ageLable.text = item.age
        
        return cell
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("데이터 위치: ", realmRepository.localRealm.configuration.fileURL!)
        
        navigationSetting()
        tableSetting()
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        realmRepository.fetchSort(dataName: "regDate", ascending: true)
        viewModel.insertData()
    }
    
    private func navigationSetting() {
        let plusButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: nil)
        plusButton.tintColor = .orange
        let sortButton = UIBarButtonItem(title: "정렬", style: .plain, target: self, action: nil)
        sortButton.tintColor = .orange
        
        self.navigationItem.rightBarButtonItems = [plusButton, sortButton]
        
        plusButton.rx.tap
            .withUnretained(self)
            .bind { (viewController, _) in
                viewController.navigationController?.pushViewController(SecondViewController(), animated: true)
            }
            .disposed(by: disposeBag)
    }
    
    private func tableSetting() {
        mainView.dataTableView.register(FirstViewCell.self, forCellReuseIdentifier: FirstViewCell.identify)
        
        viewModel.userList
            .bind(to: mainView.dataTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    private func bind() {
        
    }
}

//extension FirstViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        <#code#>
//    }
//
//}
