//
//  FirstAssignmentViewController.swift.swift
//  SOPT_32
//
//  Created by JEONGEUN KIM on 2023/04/06.
//

import UIKit

class FirstAssignmentViewController: UIViewController {
    
    // MARK: - Properties
    

    // MARK: - UI Components

    private let nameLabel: UILabel = {
        let label  = UILabel()
        label.text = I18N.name
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .purple2
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: I18N.nameTextField, attributes: [NSAttributedString.Key.foregroundColor : UIColor.purple2])
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        textField.leftViewMode = .always
        textField.clearButtonMode = .whileEditing
        textField.layer.cornerRadius = 10
        textField.layer.backgroundColor = UIColor.purple0?.cgColor
        return textField
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.textColor = .purple2
        label.text = "/10"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private let presentButton: CustomButton = {
        let button = CustomButton(title: I18N.present, icon: "moon.stars.fill")
        button.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let pushButton: CustomButton = {
        let button = CustomButton(title: I18N.push, icon: "moon.stars.fill")
        button.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

//MARK: - Methods

extension FirstAssignmentViewController: Layout {
    func setUI() {
        view.backgroundColor = .white
        nameTextField.delegate = self
        
    }
    
    func setLayout() {
        [nameLabel, nameTextField,countLabel,
         presentButton, pushButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        NSLayoutConstraint.activate([countLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 5),
                                     countLabel.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor, constant: -5)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
        
    }
}

//MARK: - Action

extension FirstAssignmentViewController {
    func presentToSecondViewController() {
        let secondViewController = SecondAssignmentViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        if let name = nameTextField.text {
        secondViewController.dataBind(name: name)
        }
        self.present(secondViewController, animated: true)
    }
    
    func pushToSecondViewController() {
        let secondViewController = SecondAssignmentViewController()
        if let name = nameTextField.text {
        secondViewController.dataBind(name: name)
        }
        secondViewController.backButton.isHidden = true
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc
    private func presentButtonTapped() {
        presentToSecondViewController()
    }
    
    @objc
    private func pushButtonTapped() {
        pushToSecondViewController()
    }
}

extension FirstAssignmentViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let textFieldText = textField.text,
                let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                    return false
            }
        countLabel.text = "\(textFieldText.count)/10"
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 10
        }
}
