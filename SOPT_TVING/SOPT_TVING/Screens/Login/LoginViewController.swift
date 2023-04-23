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
    private let findAccountView = LoginHorizontalStackView(type: .Find, font: .Pretendard(.semiBold, size: 14))
    private let makeAcountView = LoginHorizontalStackView(type: .Make, font: .Pretendard(.regular, size: 14))
    private let idTextField = LoginTextField(type: .ID)
    private let passwordTextField = LoginTextField(type: .Password)
    
    // MARK: - Properties
    
    private var iconClick = false
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    private var isOn = false
    
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
            $0.delegate = self
        }
        passwordTextField.do {
            $0.delegate = self
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
    
    func loginButton(isOn: Bool) {
        loginButton.do {
            $0.configuration?.background.strokeWidth = 1
            $0.configuration?.attributedTitle = AttributedString(I18N.Login.login, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.Pretendard(.semiBold, size: 14)]))
            $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        }
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
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
        idTextField.valueChange()
        passwordTextField.valueChange()
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if idTextField.hasText && passwordTextField.hasText {
            loginButton(isOn: true)
        } else {
            loginButton(isOn: false)
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
extension LoginViewController {
    
    @objc
    private func loginButtonTapped() {
        let loginConfirmViewController = LoginConfirmViewController()
        guard let text = idTextField.text else {return}
        loginConfirmViewController.bind(text: text)
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(loginConfirmViewController, animated: true)
    }
    
    @objc
    private func idTextFieldDidchange(_ textField: UITextField) {
            idTextField.valueChange()
    }
    @objc
    private func passwordTextFieldDidchange(_ textField: UITextField) {
          passwordTextField.valueChange()
    }
}
