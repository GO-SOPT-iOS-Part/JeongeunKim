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
    private let findAccountView = LoginHorizontalStackView(type: .Find)
    private let makeAcountView = LoginHorizontalStackView(type: .Make)
    
    private let idTextField = LoginTextField(type: .ID)
    private let passwordTextField = LoginTextField(type: .Password)

    // MARK: - Properties
    
    private var iconClick = false
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    private var isOn = false
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
        completeButton(isOn: false)
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
        idTextField.do {
            $0.delegate = self
        }
        passwordTextField.do {
            $0.delegate = self
        }
        loginButton.do {
            $0.configuration?.background.strokeWidth = 1
            $0.configuration?.attributedTitle = AttributedString(I18N.Login.login, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.Pretendard(.semiBold, size: 14)]))
            $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        }
    }

    func setLayout() {
        view.addSubviews(navigationView, titleLabel, idTextField, passwordTextField, loginButton, findAccountView, makeAcountView)
        
        navigationView.snp.makeConstraints {
            $0.top.equalTo(safeArea)
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.height.equalTo(46)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom)
            $0.centerX.equalTo(safeArea)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(27)
            $0.directionalHorizontalEdges.equalTo(safeArea).inset(20)
            $0.height.equalTo(52)
        }
        passwordTextField.snp.updateConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.directionalHorizontalEdges.equalTo(safeArea).inset(20)
            $0.height.equalTo(52)
        }
        loginButton.snp.updateConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.directionalHorizontalEdges.equalTo(safeArea).inset(20)
            $0.height.equalTo(52)
        }
        findAccountView.snp.updateConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.height.equalTo(50)
        }
        makeAcountView.snp.makeConstraints {
            $0.top.equalTo(findAccountView.snp.bottom)
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.height.equalTo(50)
        }
    }
    
    func completeButton(isOn: Bool) {
        switch isOn {
        case true:
            loginButton.do {
                $0.isUserInteractionEnabled = true
                $0.configuration?.background.backgroundColor = .tv_red
                $0.configuration?.background.strokeColor = .clear
                $0.configuration?.baseForegroundColor = .white}
        case false:
            loginButton.do {
                $0.isUserInteractionEnabled = false
                $0.configuration?.background.backgroundColor = .clear
                $0.configuration?.background.strokeColor = .tv_gay4
                $0.configuration?.baseForegroundColor = .tv_gay2
            }
        }
    }
}
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if idTextField.text?.isEmpty == true && passwordTextField.text?.isEmpty == true {
            self.completeButton(isOn: false)
        } else {
            self.completeButton(isOn: true)
        }
    }
}
extension LoginViewController {
    @objc
    private func loginButtonTapped() {
        print("tapped ")
    }
}
