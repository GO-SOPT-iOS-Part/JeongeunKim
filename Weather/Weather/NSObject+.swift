//
//  NSObject+.swift
//  Weather
//
//  Created by JEONGEUN KIM on 2023/05/06.
//

import Foundation

extension NSObject {
    static var identifier: String {
        return String(describing: self)
    }
}
