//
//  MyPageViewController.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/28.
//

import UIKit

import SnapKit
import Then

class MyPageViewController: BaseViewController {
    
    // MARK: - Properties
    private let profileItem: [ProfileModel] = ProfileModel.item
    private let firstItem: [InfoFirstModel] = InfoFirstModel.items
    private let secondItem: [InfoSecondModel] = InfoSecondModel.items
    private let thirdItem: [InfoThirdModel] = InfoThirdModel.items
    
    enum Sections: Int, Hashable {
        case profile, first, second, third
    }
    typealias Item = AnyHashable
    
    private var dataSource: UICollectionViewDiffableDataSource<Sections, Item>! = nil
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    
    // MARK: - UI Components
    
    private let navigationView = CustomNavigationView(icon: .btnBefore, btnImage1: .icBell, btnImage2: .icSet)
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setupDataSource()
        reloadData()
    }
    
    override func setUI() {
        view.backgroundColor = .black
    }
    
    override func setLayout() {
        view.addSubviews(navigationView, collectionView)
        
        navigationView.snp.makeConstraints {
            $0.top.equalTo(safeArea)
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.height.equalTo(46)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom)
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.bottom.equalToSuperview()
        }
    }
}

// MARK: - Methods

extension MyPageViewController {
    private func register() {
        collectionView.register(MyProfileCollectionViewCell.self, forCellWithReuseIdentifier: MyProfileCollectionViewCell.identifier)
        collectionView.register(MypageCollectionViewCell.self, forCellWithReuseIdentifier: MypageCollectionViewCell.identifier)
        collectionView.register(MyPageFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MyPageFooterView.identifier)
        collectionView.register(MyPageButtonFooterReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MyPageButtonFooterReusableView.identifier)
    }
    
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Sections, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
            switch section {
            case .profile:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyProfileCollectionViewCell.identifier, for: indexPath) as! MyProfileCollectionViewCell
                cell.configure(model: item as! ProfileModel )
                return cell
            case .first:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MypageCollectionViewCell.identifier, for: indexPath) as! MypageCollectionViewCell
                cell.configureWithIcon(model: item as! InfoFirstModel )
                cell.backgroundColor = .tv_gray5
                return cell
            case .second:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MypageCollectionViewCell.identifier, for: indexPath) as! MypageCollectionViewCell
                cell.configureWithArrow(model: item as! InfoSecondModel )
                return cell
            case .third:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MypageCollectionViewCell.identifier, for: indexPath) as! MypageCollectionViewCell
                cell.configureWithArrow(model: item as! InfoThirdModel)
                return cell
            }
        })
    }
    
    private func reloadData() {
        var snapShot = NSDiffableDataSourceSnapshot<Sections, Item>()
        defer {
            dataSource.apply(snapShot, animatingDifferences: false)
        }
        snapShot.appendSections([.profile, .first, .second, .third])
        snapShot.appendItems(profileItem, toSection: .profile)
        snapShot.appendItems(firstItem, toSection: .first)
        snapShot.appendItems(secondItem, toSection: .second)
        snapShot.appendItems(thirdItem, toSection: .third)
        
        dataSource.supplementaryViewProvider = { (collectionView, _, indexPath) in
            switch indexPath.section {
            
            case 1:
                guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MyPageFooterView.identifier, for: indexPath) as? MyPageFooterView else { return UICollectionReusableView() }
                return footer
            default:
                guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MyPageButtonFooterReusableView.identifier, for: indexPath) as? MyPageButtonFooterReusableView else { return UICollectionReusableView() }
                return footer
            }
        }
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvirnment in
            var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
            config.backgroundColor = .clear
            config.showsSeparators = false
            let section = self.dataSource.snapshot().sectionIdentifiers[sectionIndex]
            switch section {
            case .first, .third:
                config.footerMode = .supplementary
            default:
                config.footerMode = .none
            }
            let layoutSection = NSCollectionLayoutSection.list(using: config, layoutEnvironment: layoutEnvirnment)
            
            switch section {
            case .third:
                let backgroundItem = NSCollectionLayoutDecorationItem.background(elementKind: BackgroundSupplementaryView.identifier)
                layoutSection.decorationItems = [backgroundItem]
            default:
                break
            }
            layoutSection.orthogonalScrollingBehavior = .none
            layoutSection.interGroupSpacing = 0
            layoutSection.contentInsets = .init(top: 15, leading: 0, bottom: 15, trailing: 0)
            return layoutSection
        }
        layout.register(BackgroundSupplementaryView.self, forDecorationViewOfKind: BackgroundSupplementaryView.identifier)
        return layout
    }
}
