//
//  CategoryXib.swift
//  SweetIsland
//
//  Created by Kirill Trokhov on 04.09.2020.
//  Copyright © 2020 Kirill. All rights reserved.
//

import UIKit

class CategoryXib: UIView {
    @IBOutlet var contentViewNew: UIView!
    @IBOutlet weak var LabelCategoryXib: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func  commonInit(){
        Bundle.main.loadNibNamed("CategoryXib", owner: self, options: nil)
        contentViewNew.frame = self.bounds
        contentViewNew.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentViewNew.layer.cornerRadius = 25
        contentViewNew.layer.masksToBounds = true
        addSubview(contentViewNew)
    }
    
}
