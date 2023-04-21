//
//  UITextField+.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/21.
//

import UIKit

import SnapKit
import Then
extension UITextField {
    func setLeftPadding(amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPadding(amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    /// UITextField의 상태를 리턴함
    var isEmpty: Bool {
        if text?.isEmpty ?? true {
            return true
        }
        return false
    }
    
    /// 자간 설정 메서드
    func setCharacterSpacing(_ spacing: CGFloat) {
        let attributedStr = NSMutableAttributedString(string: self.text ?? "")
        attributedStr.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: attributedStr.length))
        self.attributedText = attributedStr
    }
    
    func setPlaceholder(color: UIColor) {
        guard let string = self.placeholder else {
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
    
    func modifyClearButtonWithImage(clear: UIImage, secure: UIImage?) {
        let textFieldView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 40))
        let clearButton = UIButton(type: .custom)
        clearButton.setImage(clear, for: .normal)
        clearButton.frame = CGRect(x: 0, y: 5, width: 30, height: 30)
        clearButton.contentMode = .scaleAspectFit
        clearButton.addTarget(self, action: #selector(UITextField.clear(sender:) ), for: .touchUpInside)

        let secureButton = UIButton(type: .custom)
        secureButton.setImage(secure, for: .normal)
        secureButton.frame = CGRect(x: 30, y: 5, width: 30, height: 30)
        secureButton.contentMode = .scaleAspectFit
        secureButton.addTarget(self, action: #selector(UITextField.secureButtonTapped(sender:)), for: .touchUpInside)

        textFieldView.addSubview(clearButton)
        textFieldView.addSubview(secureButton)

        self.rightView = textFieldView
        self.rightViewMode = .whileEditing
    }
    
    @objc func clear(sender: AnyObject) {
        self.text = ""
        sendActions(for: .editingChanged)
    }
    @objc
    private func secureButtonTapped(sender: UIButton) {
        print("ee")
        isSecureTextEntry.toggle()
        //self.secureButton.isSelected.toggle()
    }
}
