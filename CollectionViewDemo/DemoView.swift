//
//  DemoView.swift
//  CollectionViewDemo
//
//  Created by саргашкаева on 4.03.2023.
//

import UIKit


class DemoView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var homeTableView: UITableView = {
        let table = UITableView()
        table.register(NatureTableViewCell.self, forCellReuseIdentifier: NatureTableViewCell.identifier)
        table.register(BlogTableViewCell.self, forCellReuseIdentifier: BlogTableViewCell.identifier)
        table.register(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.identifier)
        table.register(SightseeingTableViewCell.self, forCellReuseIdentifier: SightseeingTableViewCell.identifier)
        table.register(TableHeader.self, forHeaderFooterViewReuseIdentifier: TableHeader.identifier)
        table.backgroundColor = .white
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .none
        return table
    }()
    
    
    private func setConstraints() {
        addSubview(homeTableView)
        homeTableView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(105)
        }
    }
}
