//
//  UIButton+.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/21.
//

import UIKit

extension UIButton {
    func setUnderline() {
        guard let title = configuration?.attributedTitle else { return }
        let attributedString = NSMutableAttributedString(title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: attributedString.string.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
}
