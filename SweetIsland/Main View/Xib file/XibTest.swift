//
//  XibTest.swift
//  SweetIsland
//
//  Created by Kirill Trokhov on 27.08.2020.
//  Copyright © 2020 Kirill. All rights reserved.
//

import UIKit

class XibTest: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var LabelView: UILabel!
    @IBOutlet weak var TextFieldView: UITextField!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func  commonInit(){
        Bundle.main.loadNibNamed("XibTest", owner: self, options: nil)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
