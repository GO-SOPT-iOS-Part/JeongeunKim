//
//  LoginTextField.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/21.
//

import UIKit

import SnapKit
import Then

class LoginTextField: UITextField {
    
    // MARK: - Properties
    
    private var isSecure = false
    
    // MARK: - UI Components
    
    let secureButton = UIButton(configuration: .plain())
    
    init(type: LoginType) {
        super.init(frame: .zero)
        setUI(type: type)
        setPlaceholder(color: .tv_gay2!)
        setLeftPadding(amount: 23)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension LoginTextField {
    private func setUI(type: LoginType) {
        layer.cornerRadius = 3
        backgroundColor = .tv_gay4
        
        secureButton.do {
            $0.isHidden = true
            $0.addTarget(self, action: #selector(secureButtonTapped), for: .touchUpInside)
        }
        
        secureButton.configurationUpdateHandler = { btn in
            switch btn.state {
            case .selected:
                btn.configuration?.image = .icEye
                btn.configuration?.background.backgroundColor = .clear
            case .normal:
                btn.configuration?.image = .icEyeSlash
            default:
                break
            }
        }
        
        switch type {
        case .ID:
            self.placeholder = type.title
        case .Password:
            rightView = secureButton
            rightViewMode = .always
            placeholder = type.title
        }
    }
    func valueChange() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.tv_gay1?.cgColor
    }
}

// Action

extension LoginTextField {
    @objc
    private func textFieldTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        layer.borderWidth = 1
        layer.borderColor = UIColor.tv_gay1?.cgColor
    }
    @objc
    private func secureButtonTapped(sender: UIButton) {
        print("ee")
        isSecureTextEntry.toggle()
        secureButton.isSelected.toggle()
    }
}
