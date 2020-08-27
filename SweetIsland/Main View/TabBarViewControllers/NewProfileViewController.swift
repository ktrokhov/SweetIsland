//
//  NewProfileViewController.swift
//  SweetIsland
//
//  Created by Kirill Trokhov on 28.08.2020.
//  Copyright © 2020 Kirill. All rights reserved.
//

import UIKit

class NewProfileViewController: UIViewController {

    @IBOutlet weak var Catalog: ProfileXib!
    @IBOutlet weak var Basket: ProfileXib!
    @IBOutlet weak var Favorite: ProfileXib!
    @IBOutlet weak var Orders: ProfileXib!
    @IBOutlet weak var Logout: ProfileXib!
    override func viewDidLoad() {
        super.viewDidLoad()
            assignbackground()
            InformatioForXib()
          }
    
    
    func InformatioForXib() {
        Catalog.IconImage.image = UIImage(named: "NewHome")
        Catalog.delegate = self
        Catalog.backgroundColor = .clear
        print("lol")
        
        Basket.IconImage.image = UIImage(named: "Cart")
        Basket.backgroundColor = .clear
        
        Favorite.IconImage.image = UIImage(named: "Favorite")
        Favorite.backgroundColor = .clear
        
        Orders.IconImage.image = UIImage(named: "Orders")
        Orders.backgroundColor = .clear
        
        Logout.IconImage.image = UIImage(named: "Logout")
        Logout.backgroundColor = .clear
        
        
    }
    
    
    func assignbackground(){
          let background = UIImage(named: "BackForLogin")

          var imageView : UIImageView!
          imageView = UIImageView(frame: view.bounds)
//          imageView.contentMode =  UIViewContentMode.ScaleAspectFill
          imageView.clipsToBounds = true
          imageView.image = background
          imageView.center = view.center
          view.addSubview(imageView)
          self.view.sendSubviewToBack(imageView)
      }

}

extension NewProfileViewController: ProfileXibDelegate {
    func sampleButtonTapped(_ button: ProfileXib) {
        print("Here")
        let loginView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "RegistrationViewStory")
        loginView.modalPresentationStyle = .fullScreen
        self.present(loginView, animated: true, completion: nil)
    }
}
