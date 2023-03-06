//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by саргашкаева on 3.03.2023.
//

import UIKit

class DemoViewController: UIViewController {
    
    private let demoView = DemoView()
    
    override func loadView() {
        super.loadView()
        view = demoView
        demoView.homeTableView.delegate = self
        demoView.homeTableView.dataSource = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension DemoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Categories.allCases.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let type = Categories(rawValue: indexPath.section) else { return UITableViewCell() }
        switch type {
        case .Nature:
             let cell = tableView.dequeueReusableCell(withIdentifier: NatureTableViewCell.identifier, for: indexPath) as! NatureTableViewCell
            cell.delegate = self
            return cell
        case .Sightseeing:
            let cell = tableView.dequeueReusableCell(withIdentifier: SightseeingTableViewCell.identifier, for: indexPath) as! SightseeingTableViewCell
           return cell
        case .Blogs:
            let cell = tableView.dequeueReusableCell(withIdentifier: BlogTableViewCell.identifier, for: indexPath) as! BlogTableViewCell
           return cell
        case .Articles:
            let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as! ArticleTableViewCell
           return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableHeader.identifier) as! TableHeader
        guard let type = Categories(rawValue: section) else { return UIView() }
        switch type {
        case .Nature:
            view.configure(name: type.name)
        case .Sightseeing:
            view.configure(name: type.name)
        case .Blogs:
            view.configure(name: type.name)
        case .Articles:
            view.configure(name: type.name)
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

}

extension DemoViewController: NatureTableViewCellDelegate {
    func didTapFavButton(index: Int) {
        print(index)
    }
    
    
}

