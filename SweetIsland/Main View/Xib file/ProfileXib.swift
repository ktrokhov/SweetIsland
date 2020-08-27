//
//  ProfileXib.swift
//  SweetIsland
//
//  Created by Kirill Trokhov on 28.08.2020.
//  Copyright © 2020 Kirill. All rights reserved.
//

import UIKit

protocol ProfileXibDelegate: class {
    func sampleButtonTapped(_ button: ProfileXib)
}

@IBDesignable
class ProfileXib: UIView {

    @IBOutlet var contentView: ProfileXib!
    @IBOutlet weak var IconImage: UIImageView!
    @IBOutlet weak var CustomButton: UIButton!
   
    
    weak var delegate: ProfileXibDelegate?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func  commonInit(){
        Bundle.main.loadNibNamed("ProfileXib", owner: self, options: nil)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(contentView)
    }
    @IBAction func ButtonTapped(_ sender: Any) {
        delegate?.sampleButtonTapped(self)
    }
    
}
