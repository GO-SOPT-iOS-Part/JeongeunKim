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
    
    typealias DataSource = UICollectionViewDiffableDataSource<Sections, AnyHashable>
    private var dataSource: DataSource?
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
        collectionView.registerCells(cells: [MyProfileCollectionViewCell.self, MypageCollectionViewCell.self])
        collectionView.registerFooters(footers: [MyPageFooterView.self, MyPageButtonFooterReusableView.self])
    }
    
    private func setupDataSource() {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            var section = self.dataSource?.snapshot().sectionIdentifiers[indexPath.section]
            switch section {
            case .profile:
                let cell: MyProfileCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
                cell.configure(model: item as! ProfileModel )
                return cell
            case .first, .second, .third, .none:
                let cell: MypageCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
                if section == .first {
                    cell.configureWithIcon(model: item as! InfoFirstModel)
                    cell.backgroundColor = .tv_gray5
                }
                else if section == .second {
                    cell.configureWithArrow(model: item as! InfoSecondModel )
                }
                else { cell.configureWithArrow(model: item as! InfoThirdModel) }
                return cell
            }
        })
    }
    
    private func reloadData() {
        var snapShot = NSDiffableDataSourceSnapshot<Sections, AnyHashable>()
        defer {
            dataSource?.apply(snapShot, animatingDifferences: false)
        }
        snapShot.appendSections([.profile, .first, .second, .third])
        [profileItem: .profile, firstItem: .first, secondItem: .second, thirdItem: .third]
            .forEach { snapShot.appendItems($0.key as! [AnyHashable], toSection: $0.value) }
        
        dataSource?.supplementaryViewProvider = { (collectionView, _, indexPath) in
            switch indexPath.section {
            case 1:
                let footer: MyPageFooterView  = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, indexPath: indexPath)
                return footer
            default:
                let footer: MyPageButtonFooterReusableView  = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, indexPath: indexPath)
                return footer
            }
        }
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvirnment in
            var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
            config.backgroundColor = .clear
            config.showsSeparators = false
            let section = self.dataSource?.snapshot().sectionIdentifiers[sectionIndex]
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
        layout.register(BackgroundSupplementaryView.self)
        return layout
    }
}
