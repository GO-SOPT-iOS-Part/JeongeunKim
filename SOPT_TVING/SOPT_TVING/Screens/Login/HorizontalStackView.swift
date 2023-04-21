//
//  HorizontalStackView.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/21.
//

import UIKit

import SnapKit
import Then

class HorizontalStackView: UIView {
    
    // MARK: - Properties
    
    private var config = UIButton.Configuration.plain()
    
    // MARK: - UI Components
    
    private let findID = UIButton(configuration: .plain())
    private let findPassword = UIButton(configuration: .plain())
    private let makeNickName = UIButton(configuration: .plain())
    private let findAccount = UILabel()
    private let horizontolStackView = UIStackView()
    private let lineView = UIView()
    private let button = UIButton()
    
    // MARK: - Life Cycle
    
    init(viewType: LoginViewType) {
        super.init(frame: .zero)
        setUI(viewType: viewType)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

private extension HorizontalStackView {
    func setUI(viewType: LoginViewType) {
        let arrayString = [findID, findPassword, makeNickName]
        arrayString.forEach {
            $0.configuration?.title = I18N.Login.findAccount[arrayString.firstIndex(of: $0)!]
            $0.configuration?.baseForegroundColor = .tv_gay2
            $0.titleLabel?.font = .Pretendard(.semiBold, size: 14)
        }
        makeNickName.do {
            $0.setUnderline()
        }
        findAccount.do {
            $0.text = I18N.Login.findAccountLabel
            $0.textColor = .tv_gay1
            $0.font = .Pretendard(.semiBold, size: 14)
        }
        lineView.do {
            $0.backgroundColor = .tv_gay4
        }
        horizontolStackView.do {
            $0.axis = .horizontal
            $0.spacing = 33
            $0.distribution = .equalSpacing
        }
        
        switch viewType {
        case .Find:
            horizontolStackView.addArrangedSubviews(findID, lineView, findPassword)
        case .Make:
            horizontolStackView.addArrangedSubviews(findAccount, makeNickName)
        }
    }
    
    func setLayout() {
        addSubviews(horizontolStackView)
        
        horizontolStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        lineView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 1, height: 12))
        }
    }
}
