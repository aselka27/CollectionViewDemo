//
//  NatureCollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by саргашкаева on 3.03.2023.
//

import UIKit
import SnapKit

protocol NatureCollectionViewCellDelegate: AnyObject {
    func didTapFavButton(index: Int)
}


class NatureCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NatureCollectionViewCell"
    private var isFavorite: Bool = false
    weak var delegate: NatureCollectionViewCellDelegate?
    var indexPath: IndexPath?
    
    
    
    private let placeImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.masksToBounds = false
        return image
    }()
    
    private let placeName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        let heartImage = UIImage(systemName: "heart")?.applyingSymbolConfiguration(.init(pointSize: 30, weight: .bold))
        button.setImage(UIImage(systemName: "heart")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
     
        contentView.addSubview(placeImageView)
        contentView.addSubview(placeName)
        contentView.addSubview(favoriteButton)
        favoriteButton.addTarget(self, action: #selector(favButtonTapped), for: .touchUpInside)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 20
        //placeImageView.layer.cornerRadius = 20
        placeImageView.addCornerRadius(15)
        addShadow()
    }
    
    private func setConstraints() {
        placeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.right.left.equalToSuperview().inset(8)
            make.height.equalTo(110)
        }
        placeName.snp.makeConstraints { make in
            make.top.equalTo(placeImageView.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(8)
        }
        favoriteButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
        }
    }
    
     func configure(with model: Place) {
        self.placeName.text = model.name
        self.placeImageView.image = UIImage(named: model.image)
        
    }
    
    private func addShadow() {
        contentView.layer.masksToBounds = false
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.15
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 3.0
    }
    
    @objc private func favButtonTapped() {
        isFavorite.toggle()
        let heartImage = UIImage(systemName: isFavorite ? "heart.fill" : "heart")?.withRenderingMode(.alwaysOriginal).withTintColor(.red)
        favoriteButton.setImage(heartImage, for: .normal)
        delegate?.didTapFavButton(index: indexPath?.item ?? 0)
    }
}
