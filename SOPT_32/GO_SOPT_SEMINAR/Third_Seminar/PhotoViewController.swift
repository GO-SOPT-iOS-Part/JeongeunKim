//
//  PhotoViewController.swift
//  SOPT_32
//
//  Created by JEONGEUN KIM on 2023/04/22.
//

import UIKit

import SnapKit
import Then

final class PhotoViewController: BaseViewController {
    
    // MARK: - Properties
    
    private var dummyCase = Photo.dummy()
    typealias Item = Photo
    enum Section: Int, CaseIterable, Hashable {
        case  main
    }
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>! = nil
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    
    // MARK: - UI Components
    
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: createLayout())
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSource()
        reloadData()
    }
    
    override func setUI() {
        view.backgroundColor = .white
        
        collectionView.do {
            $0.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    override func setLayout() {
        register()
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(safeArea)
            $0.directionalHorizontalEdges.bottom.equalToSuperview()
        }
    }
}

// MARK: - Methods

extension PhotoViewController {
    private func register() {
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
    }
    
    // MARK: - data
    
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) in
            guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as? PhotoCell else { return UICollectionViewCell()}
            cell.configureCell(item)
            cell.handler = { [weak self] result in
                if result {
                    cell.isTapped.toggle()
                    guard let self else { return }
                    self.dummyCase[indexPath.item].heartTapped.toggle()
                }
            }
            return cell
        })
    }
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(dummyCase, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: false)
        
    }
    
    // MARK: - Layout
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1/3), heightDimension:  .fractionalWidth(1/3)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),heightDimension: .fractionalWidth(1/3)), repeatingSubitem: item, count: 3)
        group.interItemSpacing = .fixed(3)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 3
        section.contentInsets = .init(top: 20, leading: 20, bottom: 0, trailing: 20)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

