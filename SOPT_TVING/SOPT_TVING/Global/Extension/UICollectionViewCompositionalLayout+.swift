//
//  UICollectionViewCompositionalLayout+.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/05/01.
//

import UIKit

extension UICollectionViewCompositionalLayout {
    func register<T: UICollectionReusableView >(_ class: T.Type) {
        register( T.self, forDecorationViewOfKind: T.identifier )
    }
}
