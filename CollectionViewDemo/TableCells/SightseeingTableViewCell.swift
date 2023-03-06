//
//  SightseeingTableViewCell.swift
//  CollectionViewDemo
//
//  Created by саргашкаева on 3.03.2023.
//

import UIKit

class SightseeingTableViewCell: UITableViewCell {
    
    static let identifier = "SightseeingTableViewCell"
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(sightseeingCollectionView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    private lazy var sightseeingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .none
        collection.showsHorizontalScrollIndicator = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(SightseeingCollectionViewCell.self, forCellWithReuseIdentifier: SightseeingCollectionViewCell.identifier)
        return collection
    }()
    
    private func setConstraints() {
        sightseeingCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

extension SightseeingTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Place.data.filter({$0.type != Categories.Nature.rawValue}).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SightseeingCollectionViewCell.identifier, for: indexPath) as! SightseeingCollectionViewCell
        cell.configure(with: Place.data.filter({$0.type != Categories.Nature.rawValue})[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: (size.width*0.6), height: 215)
    }
}
