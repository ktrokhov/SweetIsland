//
//  CategoryCollectionViewCell.swift
//  SweetIsland
//
//  Created by Kirill on 12.06.2020.
//  Copyright © 2020 Kirill. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func generateCell(_ category: Category) {
        
        nameLabel.text = category.name
        imageView.image = category.image
    }
    
}

