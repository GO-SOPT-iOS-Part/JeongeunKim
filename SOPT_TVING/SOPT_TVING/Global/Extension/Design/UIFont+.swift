//
//  UIFont+.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/21.
//

import UIKit

extension UIFont {
    
    // MARK: - Pretendard Font
    
    public enum PretendardType: String {
        case bold = "Bold"
        case semiBold = "SemiBold"
        case extraBold = "ExtraBold"
        case regular = "Regular"
        case medium = "Medium"
    }
    
    static func Pretendard(_ type: PretendardType, size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-\(type.rawValue)", size: size)!
    }
}
