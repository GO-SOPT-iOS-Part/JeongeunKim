//
//  UIView+.swift
//  SOPT_32
//
//  Created by JEONGEUN KIM on 2023/04/06.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
    
    func makeCornerRound (radius : CGFloat){
        layer.cornerRadius = radius
        layer.masksToBounds = false
    }
    
    func makeBorder(width : CGFloat , color : UIColor ){
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}
