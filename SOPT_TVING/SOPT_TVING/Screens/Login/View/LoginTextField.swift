//
//  LoginTextField.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/21.
//

import UIKit

import SnapKit
import Then

class LoginTextField: UIView {
    
    // MARK: - Properties
    
    private var isSecure = false
    
    // MARK: - UI Components
    
    let secureImage = SecureImage(status: .off)
    lazy var secureButton = UIButton()
    let textField = UITextField()
    
    // MARK: - Life Cycle
    
    init(type: LoginType, secure: SecureStatus) {
        super.init(frame: .zero)
        setUI(type: type)
        setLayout(secure: secure)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension LoginTextField {
    private func setUI(type: LoginType) {
        makeCornerRound(radius: 3)
        backgroundColor = .tv_gay4
        
        textField.do {
            $0.setPlaceholder(color: .tv_gay2!)
            $0.setLeftPadding(amount: 23)
        }
        secureImage.do {
            $0.isHidden = true
        }
        secureButton.do {
            $0.isHidden = true
            $0.backgroundColor = .clear
            $0.addTarget(self, action: #selector(secureButtonTapped), for: .touchUpInside)
        }
        
        switch type {
        case .ID:
            textField.addClearButton(clear: .icCancel, x: 25)
            textField.placeholder = type.title
        case .Password:
            textField.isSecureTextEntry = true
            textField.addClearButton(clear: .icCancel, x: 0)
            textField.placeholder = type.title
        }
    }
    func setLayout(secure: SecureStatus) {
        switch secure {
        case .on:
            addSubviews(textField, secureImage, secureButton)
            
            secureImage.snp.makeConstraints {
                $0.trailing.equalToSuperview().inset(5)
                $0.centerY.equalToSuperview()
                $0.size.equalTo(20)
            }
            secureButton.snp.makeConstraints {
                $0.trailing.equalToSuperview().inset(5)
                $0.centerY.equalToSuperview()
                $0.size.equalTo(30)
            }
        default:
            addSubview(textField)
        }
        textField.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func valueChange(status: Bool) {
        layer.borderWidth = status ? 1 : 0
        layer.borderColor = status ? UIColor.tv_gay1?.cgColor : UIColor.clear.cgColor
        secureImage.isHidden = !status
        secureButton.isHidden = !status
    }
}

// Action

extension LoginTextField {
    @objc
    private func secureButtonTapped(sender: UIButton) {
        secureImage.toggle()
        textField.isSecureTextEntry.toggle()
        secureButton.isSelected.toggle()
    }
}
