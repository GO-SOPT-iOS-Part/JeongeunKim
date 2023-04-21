//
//  SecondAssignmentViewController.swift.swift
//  SOPT_32
//
//  Created by JEONGEUN KIM on 2023/04/06.
//

import UIKit

class SecondAssignmentViewController: UIViewController {
    
    // MARK: - Properties
    
    var name: String?
    private lazy var safeArea = self.view.safeAreaLayoutGuide

    // MARK: - UI Components

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.myName
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
     lazy var backButton: CustomButton = {
        let button = CustomButton(title: I18N.back, icon: "gobackward")
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var leftButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(leftButtonTapped))
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

extension SecondAssignmentViewController: Layout {
    func setUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .purple3
        navigationItem.leftBarButtonItem = self.leftButton
    }
    
    func setLayout() {
        [nameLabel, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: safeArea.bottomAnchor , constant: -50),
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

extension SecondAssignmentViewController {
    @objc
    private func backButtonTapped() {
        self.dismiss(animated: true)
    }
    @objc private func leftButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}


