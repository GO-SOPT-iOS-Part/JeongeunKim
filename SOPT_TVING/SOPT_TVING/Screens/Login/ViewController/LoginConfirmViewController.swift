//
//  LoginConfirmViewController.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/21.
//

import UIKit

import SnapKit
import Then

class LoginConfirmViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    
    // MARK: - UI Components
    private let userLabel = UILabel()
    private let logoImageView = UIImageView()
    private lazy var goMainButton = UIButton(configuration: .plain(), primaryAction: UIAction(handler: { (_) in
        self.navigationController?.pushViewController(MyPageViewController(), animated: true)
    }))

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

// MARK: - Methods

extension LoginConfirmViewController: Layout {

    func setUI() {
        view.backgroundColor = .black
        
        logoImageView.do {
            $0.image = .tvLogo
        }
        userLabel.do {
            $0.font = .Pretendard(.bold, size: 23)
            $0.textColor = .tv_gay1
            $0.numberOfLines = 0
            $0.textAlignment = .center
        }
        goMainButton.do {
            $0.configuration?.background.backgroundColor = .tv_red
            $0.configuration?.baseForegroundColor = .white
            $0.configuration?.attributedTitle = AttributedString(I18N.Login.goMain, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.Pretendard(.semiBold, size: 14)]))
        }
    }
    func setLayout() {
        view.addSubviews(logoImageView, userLabel, goMainButton)
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(safeArea)
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.height.equalTo(210)
        }
        userLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(67)
            $0.centerX.equalTo(safeArea)
        }
        goMainButton.snp.makeConstraints {
            $0.bottom.equalTo(safeArea).inset(66)
            $0.directionalHorizontalEdges.equalTo(safeArea).inset(20)
            $0.height.equalTo(52)
        }
    }
    func bind(text: String) {
        userLabel.text = "\(text)님\n반가워요!"
    }
}
