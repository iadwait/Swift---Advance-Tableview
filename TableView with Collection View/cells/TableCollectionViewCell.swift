//
//  TableCollectionViewCell.swift
//  TableView with Collection View
//
//  Created by Adwait Barkale on 22/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class TableCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TableCollectionViewCell"
    
    private let lblTitle : UILabel = {
       let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    private let imgView : UIImageView = {
       let iv = UIImageView()
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(lblTitle)
        contentView.addSubview(imgView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgView.frame = CGRect(x: 5, y: 15, width: contentView.frame.size.width - 10, height: contentView.frame.size.height - 5 - 50)
        lblTitle.frame = CGRect(x: 5, y: contentView.frame.size.height - 50, width: contentView.frame.size.width - 10, height: 50)
        
    }
    
    public func configure(with model: CollectionTableCellModel)
    {
        lblTitle.text = model.title
        imgView.image = UIImage(named: model.imageName)
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
