//
//  WeatherCollectionViewCell.swift
//  Weather
//
//  Created by JEONGEUN KIM on 2023/05/06.
//

import UIKit

import SnapKit
import Then

class WeatherCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    let movieImage = UIImageView()
    let movieTitle = UILabel()
    let popularity = UILabel()
    let voteCount = UILabel()
    
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

extension WeatherCollectionViewCell {
    
    func setUI() {
        movieImage.do {
            $0.contentMode = .scaleToFill
        }
        movieTitle.do {
            $0.numberOfLines = 0
            $0.textAlignment = .right
            $0.font = .systemFont(ofSize: 18, weight: .bold)
            $0.textColor = .black
        }
        popularity.do {
            $0.font = .systemFont(ofSize: 12, weight: .regular)
            $0.textColor = .black
        }
        voteCount.do {
            $0.font = .systemFont(ofSize: 12, weight: .regular)
            $0.textColor = .black
        }
        
    }
    
    func setLayout() {
        contentView.addSubviews(movieImage, movieTitle, popularity, voteCount )
        
        movieImage.snp.makeConstraints {
            $0.size.equalTo(70)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        movieTitle.snp.makeConstraints {
            $0.top.equalTo(movieImage.snp.top)
            $0.leading.equalTo(movieImage.snp.trailing).offset(50)
            $0.trailing.equalToSuperview().inset(10)
        }
        popularity.snp.makeConstraints {
            $0.top.equalTo(movieTitle.snp.bottom).offset(2)
            $0.trailing.equalToSuperview().inset(10)
        }
        voteCount.snp.makeConstraints {
            $0.top.equalTo(popularity.snp.bottom).offset(2)
            $0.trailing.equalToSuperview().inset(10)
        }
    }
  
    func configure(data: InfoResult?) {
        
        if let imageURL = data?.backdropPath {
            movieImage.getImageFromURL(imageURL)
        }
        guard let data = data else {return}
        movieTitle.text = "\(data.title)"
        popularity.text = "popularity: \(data.popularity)"
        voteCount.text = "voteCount: \(data.voteCount)"
    }
}

