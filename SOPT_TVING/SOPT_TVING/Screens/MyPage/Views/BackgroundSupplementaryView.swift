//
//  BackgroundCollectionReusableView.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/29.
//

import UIKit

import SnapKit
import Then

final class BackgroundSupplementaryView: UICollectionReusableView {
    
    // MARK: - UI Components
    
    private let lineView = UIView()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension BackgroundSupplementaryView: Layout {
    func setUI() {
        lineView.do {
            $0.backgroundColor = .tv_gay4
        }
    }
    
    func setLayout() {
        addSubview(lineView)

        lineView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.directionalHorizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
