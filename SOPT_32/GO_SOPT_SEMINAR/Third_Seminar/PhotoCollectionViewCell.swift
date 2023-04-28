//
//  PhotoCollectionViewCell.swift
//  SOPT_32
//
//  Created by JEONGEUN KIM on 2023/04/22.
//

import UIKit

import SnapKit
import Then

final class PhotoCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var isTapped: Bool = false {
        didSet {
            tapped()
        }
    }
    
    var handler: ((Bool) -> (Void))?
    
    // MARK: - UI Components
    
    let photoImage = UIImageView()
    let button = UIButton()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension PhotoCell: Layout {
    
    func setUI() {
        button.do {
            $0.tintColor = .white
            $0.addTarget(self,
                         action: #selector(heartButtonTapped),
                         for: .touchUpInside)
        }
    }
    
    func setLayout() {
        
        contentView.addSubview(photoImage)
        contentView.addSubview(button)
        
        photoImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().inset(5)
            $0.size.equalTo(30)
        }
    }
    
    func tapped() {
        let image = isTapped ? "heart.fill" : "heart"
        button.setImage(UIImage(systemName: image), for: .normal)
    }
    
    @objc
    func heartButtonTapped() {
        handler?(true)
    }
    
    func configureCell(_ photo: Photo) {
        photoImage.image = photo.image
        isTapped = photo.heartTapped
    }
}
