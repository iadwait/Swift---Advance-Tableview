//
//  CollectionTableViewCell.swift
//  TableView with Collection View
//
//  Created by Adwait Barkale on 22/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

protocol CollectionTableViewCellDelegate {
    func didSelectModel(with model: CollectionTableCellModel)
}

class CollectionTableViewCell: UITableViewCell {

    var collectionView : UICollectionView
    
    public var delegate : CollectionTableViewCellDelegate?
    
    static let identifier = "CollectionTableViewCell"
    
    var models = [CollectionTableCellModel]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 170, height: 170)
        layout.sectionInset = UIEdgeInsets(top: 15, left: 3, bottom: 15, right: 3)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(TableCollectionViewCell.self, forCellWithReuseIdentifier: TableCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .black
        
        contentView.addSubview(collectionView)
    }
    
    public func congifure(with models: [CollectionTableCellModel])
    {
        self.models = models
        collectionView.reloadData()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CollectionTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCollectionViewCell.identifier, for: indexPath) as! TableCollectionViewCell
        cell.configure(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let model = models[indexPath.row]
        delegate?.didSelectModel(with: model)
        
    }
    
}
