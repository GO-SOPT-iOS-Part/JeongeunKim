//
//  Button.swift
//  SOPT_32
//
//  Created by JEONGEUN KIM on 2023/04/06.
//

import UIKit

class CustomButton: UIView {

    // MARK: - UI Components
    
    private let button =  UIButton()
    private let iconImage = UIImageView()
    
    // MARK: - Life Cycle
    
    init(title: String, icon: String) {
        super.init(frame: .zero)
        setUI(title: title, icon: icon )
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension CustomButton {
    func setUI(title: String, icon: String? ) {
        backgroundColor = .purple1
        makeCornerRound(radius: 10)
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(.purple3, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        
        iconImage.image = UIImage(systemName: icon ?? "")?.withTintColor(UIColor.purple3!, renderingMode: .alwaysOriginal)
    }
    
    func setLayout() {
        addSubview(button)
        button.addSubview(iconImage)

        button.translatesAutoresizingMaskIntoConstraints = false
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([button.topAnchor.constraint(equalTo: topAnchor),
                                     button.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     button.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     button.bottomAnchor.constraint(equalTo: bottomAnchor)
                                    ])
        NSLayoutConstraint.activate([iconImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10 ),
                                     iconImage.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     iconImage.heightAnchor.constraint(equalToConstant: 20),
                                     iconImage.widthAnchor.constraint(equalToConstant: 20),
                                    ])
        
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
            self.button.addTarget(target,
                                  action: action,
                                  for: controlEvents)
        }
}
