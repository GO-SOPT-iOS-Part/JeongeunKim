//
//  UIView+.swift
//  Weather
//
//  Created by JEONGEUN KIM on 2023/05/06.
//

import UIKit.UIView

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
