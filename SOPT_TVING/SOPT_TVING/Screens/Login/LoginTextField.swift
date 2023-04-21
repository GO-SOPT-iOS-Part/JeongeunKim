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
    
    let secureIcon = UIButton(configuration: .plain())
    
    init(type: LoginType) {
        super.init(frame: .zero)
//        let tapGestureRecognizser = UITapGestureRecognizer(target: self, action: #selector(textFieldTapped(tapGestureRecognizer:)))
//        addGestureRecognizer(tapGestureRecognizser)
        setUI(type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension LoginTextField {
    private func setUI(type: LoginType) {
        layer.cornerRadius = 3
        setLeftPadding(amount: 23)
        
        secureIcon.do {
            $0.isHidden = true
        }
        
        secureIcon.configurationUpdateHandler = { btn in
            switch btn.state {
            case .selected:
                btn.configuration?.image = .icEye
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
            rightView = secureIcon
            rightViewMode = .always
            placeholder = type.title
        }
    }
}

// Action

extension LoginTextField {
    @objc
    private func textFieldTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        layer.borderWidth = 1
        layer.borderColor = UIColor.tv_gay1?.cgColor
    }
}
