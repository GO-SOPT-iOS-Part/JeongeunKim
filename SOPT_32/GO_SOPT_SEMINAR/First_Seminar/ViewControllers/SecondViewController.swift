//
//  SecondViewController.swift
//  SOPT_32
//
//  Created by JEONGEUN KIM on 2023/04/01.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Properties
    var name: String?
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.myName
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.back, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        dataBind()
    }
}

// MARK: - Methods

extension SecondViewController: Layout {
    internal func setUI() {
        view.backgroundColor = .white
    }
    
    internal func setLayout() {
        [nameLabel, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     backButton.heightAnchor.constraint(equalToConstant: 48)])
        
    }
    
    func dataBind(name: String) {
        nameLabel.text = name
    }
    
    func dataBind() {
        guard let name else { return }
        nameLabel.text = name
    }
}

//MARK: - Action

extension SecondViewController {
    @objc
    private func backButtonTapped() {
        self.dismiss(animated: true)
    }
}
