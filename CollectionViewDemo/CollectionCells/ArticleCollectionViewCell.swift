//
//  ArticleCollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by саргашкаева on 3.03.2023.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ArticleCollectionViewCell"
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .gray
        contentView.layer.cornerRadius = 20
        imageView.addCornerRadius(20)
        
        contentView.addSubview(imageView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(with model: Place) {
        self.imageView.image = UIImage(named: model.image)
    }
}
