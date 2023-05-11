//
//  MyProfileCollectionReusableView.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/05/10.
//

import UIKit

import SnapKit
import Then

class MyProfileCollectionReusableView: UICollectionReusableView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    let profileImage = UIImageView()
    let nameLabel = UILabel()
    let changeButton = UIButton()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension MyProfileCollectionReusableView: Layout {
    func setUI() {
        
        profileImage.do {
            $0.backgroundColor = .white
            $0.makeCornerRound(radius: 15)
        }
        nameLabel.do {
            $0.textColor = .white
            $0.font = .Pretendard(.medium, size: 17)
        }
        changeButton.do {
            $0.setTitle(I18N.MyPage.Profile.title, for: .normal)
            $0.titleLabel?.font = .Pretendard(.medium, size: 10)
            $0.makeCornerRound(radius: 2)
            $0.makeBorder(width: 1, color: .tv_gay4!)
        }
    }
    
    func setLayout() {
        addSubviews(profileImage, nameLabel, changeButton)
        
        profileImage.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 72, height: 74))
            $0.centerY.equalToSuperview()
            $0.directionalVerticalEdges.equalToSuperview()
            $0.leading.equalToSuperview().offset(24)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImage.snp.trailing).offset(22)
            $0.centerY.equalToSuperview()
        }
        changeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(23)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: 70, height: 25))
        }
    }
    
    func configure(model: ProfileModel) {
        profileImage.image = model.image
        nameLabel.text = model.name
    }
}
