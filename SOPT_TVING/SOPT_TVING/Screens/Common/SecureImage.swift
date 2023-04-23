//
//  Secure.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/24.
//

import UIKit

final class SecureImage: UIView {
    
    // MARK: - Properties
    
    private var status: SecureStatus
    
    // MARK: - UI Components
    
    private lazy var secureImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = status.icon
    }

    // MARK: - Initialization
    
    init(status: SecureStatus) {
        self.status = status
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension SecureImage: Layout {
    func setUI() {
        backgroundColor = .clear
    }
    
    func setLayout() {
        addSubview(secureImageView)
        
        secureImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func updateImage() {
        secureImageView.image = status.icon
    }
    func getStatus() -> SecureStatus { self.status }
    
    func normal() {
        self.status = .off
        self.updateImage()
    }
    func selected() {
        self.status = .on
        self.updateImage()
    }
    func toggle() {
        status == .off ? self.selected() : self.normal()
    }
}
