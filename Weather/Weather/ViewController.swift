//
//  ViewController.swift
//  Weather
//
//  Created by JEONGEUN KIM on 2023/05/06.
//

import UIKit

import Alamofire
import Then
import SnapKit

class ViewController: UIViewController {
    var data: [InfoResult] = []
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfo()
        setUI()
        setLayout()
        
    }
}
extension ViewController {
    private func setUI() {
        collectionView.do {
            $0.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: WeatherCollectionViewCell.identifier)
            $0.delegate = self
            $0.dataSource = self
        }
    }
    private func setLayout() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.directionalHorizontalEdges.equalTo(safeArea)
            $0.bottom.equalToSuperview()
        }
    }
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.identifier, for: indexPath) as? WeatherCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(data: data[indexPath.row])
        return cell
    }
}
extension ViewController {
    func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                let layout = UICollectionViewCompositionalLayout(section: section)
                return layout
    }
}
extension ViewController {
    func getInfo() {
        MovieInfoService.shared.getMovieInfo { response in
            switch response {
            case .success(let data):
                guard let data = data as? MovieInfoResponse else { return }
                self.data = data.results
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                dump(data)
            default:
                return
            }
        }
    }
}
