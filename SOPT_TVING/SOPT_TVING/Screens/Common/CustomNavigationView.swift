//
//  CustomNavigationView.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/21.
//

import UIKit

import SnapKit
import Then

class CustomNavigationView: UIView {
    
    // MARK: - UI Components
    
    private let iconImage =  UIImageView()
    private let horizontalStackView = UIStackView()
    private let button1 = UIButton()
    private let button2 = UIButton()
    
    // MARK: - Life Cycle
    
    init(icon: UIImage, btnImage1: UIImage?, btnImage2: UIImage?) {
        super.init(frame: .zero)
        setUI(icon: icon, btnImage1: btnImage1, btnImage2: btnImage2)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension CustomNavigationView {
    func setUI(icon: UIImage, btnImage1: UIImage?, btnImage2: UIImage?) {
        iconImage.do {
            $0.image = icon
        }
        horizontalStackView.do {
            $0.addArrangedSubviews(button1, button2)
            $0.spacing = 10
            $0.axis = .horizontal
            $0.distribution = .fillEqually
        }
        button1.do {
            $0.setImage(btnImage1, for: .normal)
        }
        button2.do {
            $0.setImage(btnImage2, for: .normal)
        }
    }
    
    func setLayout() {
        addSubviews(iconImage, horizontalStackView)
        
        iconImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(19)
            $0.size.equalTo(CGSize(width: 8, height: 15))
            $0.centerY.equalToSuperview()
        }
        horizontalStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(25)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: 70, height: 31))
        }
    }
}
