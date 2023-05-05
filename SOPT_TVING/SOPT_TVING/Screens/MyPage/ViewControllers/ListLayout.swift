//
//  ListLayout.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/05/01.
//

import UIKit

final class ListLayout {
    class func listLayout(footer: UICollectionLayoutListConfiguration.FooterMode ) -> UICollectionLayoutListConfiguration {
        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        config.backgroundColor = .clear
        config.showsSeparators = false
        config.footerMode = footer
        return config
    }
    class func Section(_ config: UICollectionLayoutListConfiguration, _ layoutEnvironment: NSCollectionLayoutEnvironment, contentInsets: NSDirectionalEdgeInsets?, line: Bool) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection.list(using: config, layoutEnvironment: layoutEnvironment)
        let backgroundItem =  NSCollectionLayoutDecorationItem.background(elementKind: LineSupplementaryView.identifier)
        section.decorationItems = line ? [backgroundItem] : []
        section.interGroupSpacing = 0
        section.contentInsets = contentInsets ?? .init(top: 15, leading: 0, bottom: 15, trailing: 0)
        return section
    }
}
