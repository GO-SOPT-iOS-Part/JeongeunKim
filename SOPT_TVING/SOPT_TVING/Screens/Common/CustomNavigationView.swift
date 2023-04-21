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
    private let iconImage: UIImageView
    init(icon: UIImage) {
        super.init(frame: .zero)
        setUI(icon: icon)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomNavigationView {
    func setUI(icon: UIImage) {
        iconImage.do {
            $0.image = icon
        }
    }
    
    func setLayout() {
        addSubview(iconImage)
        
        iconImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(19)
            $0.size.equalTo(CGSize(width: 8, height: 15))
            $0.centerY.equalToSuperview()
        }
    }
}
