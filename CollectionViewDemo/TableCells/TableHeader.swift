//
//  TableHeader.swift
//  CollectionViewDemo
//
//  Created by саргашкаева on 4.03.2023.
//

import UIKit

class TableHeader: UITableViewHeaderFooterView {

    static let identifier = "TableHeader"
  
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(sectionName)
        contentView.backgroundColor = .white
        sectionName.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(8)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let sectionName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.text = "Nature"
        return label
    }()
    
    func configure(name: String) {
        self.sectionName.text = name
    }
}
