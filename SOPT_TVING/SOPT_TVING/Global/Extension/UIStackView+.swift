//
//  UIStackView+.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/21.
//

import UIKit

extension UIStackView {
     func addArrangedSubviews(_ views: UIView...) {
         for view in views {
             self.addArrangedSubview(view)
         }
     }
}
