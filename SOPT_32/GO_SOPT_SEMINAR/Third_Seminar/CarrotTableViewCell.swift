//
//  CarrotTableViewCell.swift
//  SOPT_32
//
//  Created by JEONGEUN KIM on 2023/04/22.
//

import UIKit

import SnapKit
import Then

class CarrotTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private lazy var carrotImage = UIImageView()
        private let productLabel = UILabel()
        private let placeLabel = UILabel()
        private let timeLabel = UILabel()
        private let reservationLabel = UILabel()
        private let priceLabel = UILabel()
        private let horizontalStackView = UIStackView()
    
    // MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setUI()
            setLayout()
        }
    
        @available(*, unavailable)
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
}
extension CarrotTableViewCell: Layout {
    func setUI() {
        
                      // 줄 간격 없애는 왼쪽 기준으로 0
              separatorInset.left = 0

                      // 터치 시 클릭 이벤트, 색상 없애기
                    selectionStyle = .none
              
              carrotImage.do {
                  $0.makeRounded(radius: 5)
              }
              
              productLabel.do {
                  $0.font = UIFont.systemFont(ofSize: 12)
              }
              
              placeLabel.do {
                  $0.font = UIFont.boldSystemFont(ofSize: 11)
              }
              
              timeLabel.do {
                  $0.font = UIFont.boldSystemFont(ofSize: 11)
              }
              
              reservationLabel.do {
                  $0.textAlignment = .center
                  $0.textColor = .white
                  $0.font = UIFont.boldSystemFont(ofSize: 11)
                  $0.makeRounded(radius: 3)
              }
              
              priceLabel.do {
                  $0.font = UIFont.boldSystemFont(ofSize: 13)
              }
              
              horizontalStackView.do {
                  $0.axis = .horizontal
                  $0.distribution = .fill
                  $0.alignment = .center
                  $0.spacing = 5
              }
    }
    
    func setLayout() {
        contentView.addSubview(carrotImage)
    }
    
    
}

