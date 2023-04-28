//
//  MyPageFooterView.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/29.
//

import UIKit

import SnapKit
import Then

class MyPageFooterView: UICollectionReusableView {
    
    // MARK: - UI Components
    
    private let title = UILabel()
    private let iconImage = UIButton()
    
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

extension MyPageFooterView: Layout {
    func setUI() {
        backgroundColor = .tv_gray5
        title.do {
            $0.numberOfLines = 0
            $0.textColor = .tv_gay2
            $0.attributedText = NSMutableAttributedString()
                .addImageInBetweenString(firstSentence: I18N.MyPage.FirstSection.beforeImage, image: .channelLogo, lastSentence: I18N.MyPage.FirstSection.afterImage)
                .withLineSpacing(7)
        }
        iconImage.do {
            $0.setImage(.icRightArrow, for: .normal)
        }
    }
    
    func setLayout() {
        addSubviews(title, iconImage)
        makeCornerRound(radius: 3)
        
        iconImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.size.equalTo(18)
            $0.trailing.equalToSuperview().inset(13)
        }
        
        title.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().inset(50)
            $0.directionalVerticalEdges.equalToSuperview().inset(10)
        }
        
    }
}
