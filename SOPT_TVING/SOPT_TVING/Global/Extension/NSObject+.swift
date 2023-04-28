//
//  NSObject+.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/28.
//

import UIKit

extension NSObject {
    static var identifier: String {
        return String(describing: self)
    }
}
