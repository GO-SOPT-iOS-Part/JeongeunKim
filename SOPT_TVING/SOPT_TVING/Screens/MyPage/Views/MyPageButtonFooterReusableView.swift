//
//  MyPageButtonFooterReusableView.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/29.
//

import UIKit

import SnapKit
import Then

class MyPageButtonFooterReusableView: UICollectionReusableView {
    
    // MARK: - UI Components
    
    private let button = UIButton()
    
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

extension MyPageButtonFooterReusableView: Layout {
    func setUI() {
        button.do {
            $0.titleLabel?.font = .Pretendard(.medium, size: 14)
            $0.setTitle(I18N.MyPage.Logout.title, for: .normal)
            $0.makeCornerRound(radius: 2)
            $0.makeBorder(width: 1, color: .tv_gay4!)
        }
    }
    func setLayout() {
        addSubview(button)
        
        button.snp.makeConstraints {
            $0.height.equalTo(55)
            $0.top.equalToSuperview()
            $0.directionalHorizontalEdges.equalToSuperview().inset(8)
        }
        
    }
}
