//
//  ViewController.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/14.
//

import UIKit

import SnapKit
import Then

class LoginConfirmViewController: UIViewController {

    private let titleLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension LoginConfirmViewController: Layout {
    func setUI() {
        titleLabel.do {
            $0.text = I18N.Login.title
            $0.font = .Pretendard(.medium, size: 23)
            $0.textColor = .tv_gay1
        }
    }
    
    func setLayout() {
        <#code#>
    }
    
}
