//
//  ProfileXib.swift
//  SweetIsland
//
//  Created by Kirill Trokhov on 28.08.2020.
//  Copyright © 2020 Kirill. All rights reserved.
//

protocol  ProfileXibDelegate{
    func nextScreen()
}

import UIKit

//protocol ProfileXibDelegate: class {
//    func sampleButtonTapped(_ button: ProfileXib)
//}

class ProfileXib: UIView {

    @IBOutlet var contentView: ProfileXib!
    @IBOutlet weak var IconImage: UIImageView!
    @IBOutlet weak var CustomButton: UIButton!
   
    
    var delegate: ProfileXibDelegate?
    
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
    @IBAction func TestButton(_ sender: Any) {
        if tag == 1 {
            CatalogView()
            print("IN")
        }
        if tag == 2 {
            CatalogView()
        }
        if tag == 3 {
            CatalogView()
        }
        if tag == 4 {
            CatalogView()
        }
        if tag == 5 {
            CatalogView()
        }
        
        print("hui Pizda")
    }
    
    private func CatalogView() {
//        let Catalog = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "CatalogStory")
//        Catalog.modalPresentationStyle = .fullScreen
//       let viewController = Catalog.instantiateViewController(withIdentifier: "CatalogStory")
        print("good")
        self.delegate?.nextScreen()
    }
}
