//
//  MypageCollectionViewCell.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/28.
//

import UIKit

import SnapKit
import Then

class MypageCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
        
    // MARK: - UI Components
    
    private let horizontalStackView = UIStackView()
    private let iconImage = UIImageView()
    private let titleLabel = UILabel()
    private let subLabel = UILabel()
    private let arrowImage = UIImageView()
    
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

extension MypageCollectionViewCell {
    private func setUI() {
        backgroundColor = .clear
        
        titleLabel.do {
            $0.textColor = .tv_gay2
            $0.font = .Pretendard(.medium, size: 15)
        }
        subLabel.do {
            $0.isHidden = true
            $0.textColor = .tv_gay2
            $0.font = .Pretendard(.medium, size: 13)
        }
        
        horizontalStackView.do {
            $0.addArrangedSubviews(iconImage, titleLabel)
            $0.axis = .horizontal
            $0.spacing = 5
        }
        arrowImage.do {
            $0.isHidden = true
            $0.image = .icRightArrow
        }
    }
    
    private func setLayout() {
        contentView.addSubviews(horizontalStackView, subLabel, arrowImage)
        
        iconImage.snp.makeConstraints {
            $0.size.equalTo(23)
        }
        subLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(23)
        }
        arrowImage.snp.makeConstraints {
            $0.size.equalTo(18)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(13)
        }
        horizontalStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(17)
            $0.bottom.equalToSuperview().inset(17)
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
        }
    }
    
    func configureWithIcon(model: InfoFirstModel) {
        subLabel.isHidden = false
        iconImage.image = model.image
        titleLabel.text = model.title
        subLabel.text = model.subTitle
        
        horizontalStackView.snp.updateConstraints {
            $0.leading.equalToSuperview().offset(8)
        }
    }
    
    func configureWithArrow(model: InfoSecondModel) {
        horizontalStackView.removeArrangedSubview(iconImage)
        iconImage.removeFromSuperview()
        titleLabel.text = model.title
        arrowImage.isHidden = false
    }
    
    func configureWithArrow(model: InfoThirdModel) {
        horizontalStackView.removeArrangedSubview(iconImage)
        iconImage.removeFromSuperview()
        titleLabel.text = model.title
        arrowImage.isHidden = false
    }
}
