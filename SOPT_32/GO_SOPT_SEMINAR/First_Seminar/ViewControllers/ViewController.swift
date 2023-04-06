//
//  ViewController.swift
//  SOPT_32
//
//  Created by JEONGEUN KIM on 2023/04/01.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.example
        return label
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

// MARK: - Methods

extension ViewController: Layout {
    internal func setUI() {
        view.backgroundColor = .white
    }
    
    internal func setLayout() {
        view.addSubview(nameLabel)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)])
    }
}


