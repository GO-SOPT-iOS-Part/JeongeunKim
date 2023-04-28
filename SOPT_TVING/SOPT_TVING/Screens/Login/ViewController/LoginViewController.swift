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
    
    private let navigationView = CustomNavigationView(icon: .btnBefore, btnImage1: nil, btnImage2:  nil)
    private let titleLabel = UILabel()
    private let loginButton = UIButton(configuration: .plain())
    private let findAccountView = LoginHorizontalStackView(type: .Find, font: .Pretendard(.semiBold, size: 14))
    private let makeAcountView = LoginHorizontalStackView(type: .Make, font: .Pretendard(.regular, size: 14))
    private let idTextField = LoginTextField(type: .ID, secure: .off)
    private let passwordTextField = LoginTextField(type: .Password, secure: .on)
    
    // MARK: - Properties
    
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        loginButton(isOn: false)
    }
}

// MARK: - Methods

extension LoginViewController: Layout {
    func setUI() {
        view.backgroundColor = .black
        titleLabel.do {
            $0.text = I18N.Login.title
            $0.font = .Pretendard(.medium, size: 23)
            $0.textColor = .tv_gay1
        }
        idTextField.do {
            $0.textField.delegate = self
            $0.textField.addTarget(self, action: #selector(idTextFieldDidchange), for: .editingDidBegin)
        }
        passwordTextField.do {
            $0.textField.delegate = self
            $0.textField.addTarget(self, action: #selector(passwordTextFieldDidchange), for: .editingDidBegin)
        }
    }
    
    func loginButton(isOn: Bool) {
        loginButton.do {
            $0.configuration?.background.strokeWidth = 1
            $0.configuration?.attributedTitle = AttributedString(I18N.Login.login, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.Pretendard(.semiBold, size: 14)]))
            $0.isUserInteractionEnabled = isOn ? true : false
            $0.configuration?.background.backgroundColor = isOn ? .tv_red : .clear
            $0.configuration?.background.strokeColor = isOn ? .clear : .tv_gay4
            $0.configuration?.baseForegroundColor = isOn ? .white : .tv_gay2
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
}

// MARK: - Delegate

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if idTextField.textField.hasText && passwordTextField.textField.hasText {
            loginButton(isOn: true)
        } else {
            loginButton(isOn: false)
        }
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        idTextField.valueChange(status: false)
        passwordTextField.valueChange(status: false)
    }
}

// MARK: - Action

extension LoginViewController {
    @objc
    private func loginButtonTapped() {
        let loginConfirmViewController = LoginConfirmViewController()
        guard let text = idTextField.textField.text else {return}
        loginConfirmViewController.bind(text: text)
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(loginConfirmViewController, animated: true)
    }
    @objc
    private func idTextFieldDidchange(_ textField: UITextField) {
        idTextField.valueChange(status: true)
    }
    @objc
    private func passwordTextFieldDidchange(_ textField: UITextField) {
        passwordTextField.valueChange(status: true)
    }
}
