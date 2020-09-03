//
//  NewCategoryXibCollectionViewCell.swift
//  SweetIsland
//
//  Created by Kirill Trokhov on 04.09.2020.
//  Copyright © 2020 Kirill. All rights reserved.
//

import UIKit

class NewCategoryXibCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var xibCategoryCell: CategoryXib!
    
    func generateCell(_ category: Category) {
        
        xibCategoryCell.LabelCategoryXib.text = category.name
        xibCategoryCell.ImageView.image = category.image
    }
}
