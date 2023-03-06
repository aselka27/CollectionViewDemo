//
//  NatureTableViewCell.swift
//  CollectionViewDemo
//
//  Created by саргашкаева on 3.03.2023.
//

import UIKit


protocol NatureTableViewCellDelegate: AnyObject {
    func didTapFavButton(index: Int)
}



class NatureTableViewCell: UITableViewCell {

    static let identifier = "NatureTableViewCell"
    weak var delegate: NatureTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(natureCollectionView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var natureCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .none
        collection.showsHorizontalScrollIndicator = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(NatureCollectionViewCell.self, forCellWithReuseIdentifier: NatureCollectionViewCell.identifier)
        return collection
    }()
    
    private func setConstraints() {
        natureCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


extension NatureTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Place.data.filter({$0.type != Categories.Sightseeing.rawValue}).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NatureCollectionViewCell.identifier, for: indexPath) as! NatureCollectionViewCell
        cell.configure(with: Place.data.filter({$0.type != Categories.Sightseeing.rawValue})[indexPath.item])
        cell.delegate = self
        cell.indexPath = indexPath
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: (size.width*0.6), height: 215)
    }
    
  
}

extension NatureTableViewCell: NatureCollectionViewCellDelegate {
    func didTapFavButton(index: Int) {
        delegate?.didTapFavButton(index: index)
    }
}
