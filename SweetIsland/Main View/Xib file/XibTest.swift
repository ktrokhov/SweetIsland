//
//  XibTest.swift
//  SweetIsland
//
//  Created by Kirill Trokhov on 27.08.2020.
//  Copyright © 2020 Kirill. All rights reserved.
//

import UIKit

class XibTest: UIView {
    @IBOutlet var contentViewNew: UIView!
    @IBOutlet weak var newLabel: UILabel!
    @IBOutlet weak var MyTextField: UITextField!
    @IBOutlet weak var MyImageView: UIImageView!
    
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
        contentViewNew.frame = self.bounds
        contentViewNew.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(contentViewNew)
    }
}
