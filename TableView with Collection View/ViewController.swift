//
//  ViewController.swift
//  TableView with Collection View
//
//  Created by Adwait Barkale on 22/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tableView : UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()
    
    var models = [CellModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupModels()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableHeaderView = getHeaderView()
    }

    func getHeaderView() -> UIView
    {
        let headerView = UIView()
        headerView.frame = .init(x: 0, y: 0, width: self.tableView.frame.size.width, height: 120)
        headerView.backgroundColor = .green

        let lblTitle = UILabel()
        lblTitle.frame = .init(x: 10, y: 10, width: self.view.frame.size.width - 20, height: 100)
        lblTitle.text = "Advance TableView with Collection View Embedded in Cell"
        lblTitle.numberOfLines = 0
        lblTitle.textAlignment = .center
        lblTitle.font = .systemFont(ofSize: 21, weight: .bold)
        lblTitle.textColor = .black
        headerView.addSubview(lblTitle)
        return headerView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
    
    func setupModels()
    {
        models.append(.collectionView(models: [
        CollectionTableCellModel(title: "Title 1", imageName: "aa"),
        CollectionTableCellModel(title: "Title 2", imageName: "bb"),
        CollectionTableCellModel(title: "Title 3", imageName: "cc"),
        CollectionTableCellModel(title: "Title 4", imageName: "dd"),
        CollectionTableCellModel(title: "Title 5", imageName: "ee"),
        CollectionTableCellModel(title: "Title 6", imageName: "ff"),
        CollectionTableCellModel(title: "Title 7", imageName: "gg")
        ], rows: 2))
        
        models.append(.list(models: [
        ListCellModel(title: "Test1"),
        ListCellModel(title: "Test2"),
        ListCellModel(title: "Test3"),
        ListCellModel(title: "Test4"),
        ListCellModel(title: "Test5")
        ]))
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch models[section]
        {
            
        case .collectionView(_, _):
            return 1
        case .list(let models):
            return models.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch models[indexPath.section]
        {
        case .list(let models):
            let model = models[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = model.title
            return cell
        case .collectionView(let models, _):
            let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
            cell.delegate = self
            cell.congifure(with: models)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
     
        print("Normal List Tapped - \(indexPath.row)")
        print("Section - \(indexPath.section)")
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch models[indexPath.section]
        {
        case .list(_):
            return 50
        case .collectionView(_, let rows):
            return 190 * CGFloat(rows)
        }
    }
    
}

extension ViewController : CollectionTableViewCellDelegate
{
    func didSelectModel(with model: CollectionTableCellModel) {
        print("Model Selected - \(model.title)")
    }
}
