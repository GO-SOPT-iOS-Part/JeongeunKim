//
//  CarrotViewController.swift
//  SOPT_32
//
//  Created by JEONGEUN KIM on 2023/04/22.
//

import UIKit

import SnapKit
import Then

class CarrotViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let dummy = Carrot.dummy()
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    private lazy var safeAreaInset = self.view.safeAreaInsets
    
    // MARK: - UI Components
    
    private let tableView = UITableView()
    
    // MARK: - Methods
    
    override func setLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(safeAreaInset)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}
