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
    
    private let firstItem: [InfoFirstModel] = InfoFirstModel.items
    private let secondItem: [InfoSecondModel] = InfoSecondModel.items
    private let thirdItem: [InfoThirdModel] = InfoThirdModel.items
    
    enum Sections: Int, Hashable {
        case first, second, third
    }
    typealias Item = AnyHashable
    
    private var dataSource: UICollectionViewDiffableDataSource<Sections, Item>! = nil
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    
    // MARK: - UI Components
    
    private let navigationView = CustomNavigationView(icon: .btnBefore)
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
        collectionView.register(MypageCollectionViewCell.self, forCellWithReuseIdentifier: MypageCollectionViewCell.identifier)
    }
    
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Sections, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
            switch section {
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
        snapShot.appendSections([.first, .second, .third])
        snapShot.appendItems(firstItem, toSection: .first)
        snapShot.appendItems(secondItem, toSection: .second)
        snapShot.appendItems(thirdItem, toSection: .third)
        }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { _, layoutEnvirnment in
            var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
            config.backgroundColor = .clear
            config.showsSeparators = false
            
            let layoutSection = NSCollectionLayoutSection.list(using: config, layoutEnvironment: layoutEnvirnment)
            layoutSection.orthogonalScrollingBehavior = .none
          //  layoutSection.interGroupSpacing = 18
            layoutSection.contentInsets = .zero
            
            return layoutSection
        }
        return layout
    }
}
