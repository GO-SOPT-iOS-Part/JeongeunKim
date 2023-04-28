//
//  CommonView.swift
//  SOPT_32
//
//  Created by JEONGEUN KIM on 2023/04/22.
//

import UIKit

import SnapKit
import Then

final class CommonView: BaseView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    let nameLabel = UILabel()
    let nameTextField = UITextField()
    let backButton = UIButton()
    
    // MARK: - Life Cycle
    override func setStyle() {
        nameLabel.do {
            $0.text = "이름이 무엇인가요!?"
            $0.font = .systemFont(ofSize: 16)
            $0.textColor = .blue
            $0.textAlignment = .center
        }
        nameTextField.do {
            $0.placeholder = "이름을 입력해주세요"
            $0.clearButtonMode = .whileEditing
            $0.layer.borderColor = UIColor.gray.cgColor
            $0.layer.borderWidth = 1
        }
        backButton.do {
            $0.setTitle("뒤로가기!", for: .normal)
            $0.backgroundColor = .red
            $0.setTitleColor(.blue, for: .normal)
        }
    }
    override func setLayout() {
        
        [nameLabel, backButton, nameTextField]
            .forEach { addSubview($0) }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(nameLabel.self).inset(30)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.self).offset(-50)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(48)
        }
    }
}
