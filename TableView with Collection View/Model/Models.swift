//
//  Models.swift
//  TableView with Collection View
//
//  Created by Adwait Barkale on 22/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import Foundation

enum CellModel
{
    case collectionView(models: [CollectionTableCellModel],rows: Int)
    case list(models: [ListCellModel])
}

struct ListCellModel {
    let title: String
}

struct CollectionTableCellModel
{
    let title: String
    let imageName: String
}
