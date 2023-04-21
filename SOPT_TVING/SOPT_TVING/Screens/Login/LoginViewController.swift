//
//  ViewController.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/14.
//

import UIKit

import SnapKit
import Then

class LoginViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let navigationView = CustomNavigationView(icon: .btnBefore)
    private let titleLabel = UILabel()
    private let loginButton = UIButton(configuration: .plain())
    private let findAccountView = LoginHorizontalStackView(viewType: .Find)
    private let makeAcountView = LoginHorizontalStackView(viewType: .Make)
    
    // MARK: - Properties
    
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

// MARK: - Methods

extension LoginViewController: Layout {
    func setUI() {
        titleLabel.do {
            $0.text = I18N.Login.title
            $0.font = .Pretendard(.medium, size: 23)
            $0.textColor = .tv_gay1
        }
        loginButton.do {
            $0.configuration?.background.strokeColor = .tv_gay2 //border색 
            $0.configuration?.background.strokeWidth = 1
            $0.configuration?.baseForegroundColor = .tv_gay2 // 글자색
//            $0.configuration?.background.backgroundColor = .tv_red // 배경
            $0.configuration?.attributedTitle = AttributedString(I18N.Login.login, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.Pretendard(.semiBold, size: 14)]))
        }
    }
    
    func setLayout() {
        view.addSubviews(navigationView, titleLabel, loginButton, findAccountView, makeAcountView)
        
        navigationView.snp.makeConstraints {
            $0.top.equalTo(safeArea)
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.height.equalTo(46)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom)
            $0.centerX.equalTo(safeArea)
        }
        loginButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.directionalHorizontalEdges.equalTo(safeArea).inset(20)
            $0.height.equalTo(52)
        }
        findAccountView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(50)
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.height.equalTo(60)
        }
        makeAcountView.snp.makeConstraints {
            $0.top.equalTo(findAccountView.snp.bottom)
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.height.equalTo(60)
        }
    }
    
}
