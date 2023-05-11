//
//  FourViewController.swift
//  SOPT_32
//
//  Created by JEONGEUN KIM on 2023/05/06.
//

import UIKit

import Alamofire
import SnapKit
import Then

class FourViewController: UIViewController {
    private let label  = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        signUp()
        setLayout()
    }
}
extension FourViewController {
    private func setUI(){
        label.do {
            $0.text = "성공"
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 20, weight: .bold)
            $0.isHidden = true
        }
    }
    private func setLayout() {
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    private func signUp() {
        SignUpService.shared.signUp(email: "jeuniii@naver.com", nickname: "jeuniiii", password: "Jungeun12!!") { response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else {return}
                self.label.isHidden = false
                dump(data)
            default:
                return
            }
        }
    }
}
