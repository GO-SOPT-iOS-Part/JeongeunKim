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
    
    private let topLineView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BackgroundSupplementaryView: Layout {
    func setUI() {
        topLineView.do {
            $0.backgroundColor = .tv_gay4
        }
    }
    
    func setLayout() {
        addSubview(topLineView)
        
        topLineView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.directionalHorizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
