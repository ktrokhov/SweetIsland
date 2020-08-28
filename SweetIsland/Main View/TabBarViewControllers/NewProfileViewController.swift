//
//  NewProfileViewController.swift
//  SweetIsland
//
//  Created by Kirill Trokhov on 28.08.2020.
//  Copyright © 2020 Kirill. All rights reserved.
//

import UIKit

class NewProfileViewController: UIViewController, ProfileXibDelegate {

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
    
    
    @IBAction func BasketButtonTapped(_ sender: Any) {
        redirectToBasket()
    }
    
    func InformatioForXib() {
        Catalog.IconImage.image = UIImage(named: "NewHome")
//        Catalog.delegate = self
        Catalog.tag = 1
        Catalog.TestButton(self)
        Catalog.CustomButton.setTitle("Каталог", for: .normal)
        Catalog.backgroundColor = .clear
        
        Basket.tag = 2
        Basket.TestButton(self)
        Basket.IconImage.image = UIImage(named: "Cart")
        Basket.CustomButton.setTitle("Моя корзина", for: .normal)
        Basket.backgroundColor = .clear
        
        Favorite.tag = 3
        Favorite.TestButton(self)
        Favorite.IconImage.image = UIImage(named: "Favorite")
        Favorite.CustomButton.setTitle("Избранное", for: .normal)
        Favorite.backgroundColor = .clear
        
        Orders.tag = 4
        Orders.TestButton(self)
        Orders.IconImage.image = UIImage(named: "Orders")
        Orders.CustomButton.setTitle("Мои заказы", for: .normal)
        Orders.backgroundColor = .clear
        
        Logout.tag = 5
        Logout.TestButton(self)
        Logout.IconImage.image = UIImage(named: "Logout")
        Logout.CustomButton.setTitle("Выйти", for: .normal)
        Logout.backgroundColor = .clear
        
        
    }
    
    private func redirectToBasket() {
      let basketView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "BasketStory")
             basketView.modalPresentationStyle = .fullScreen
             self.present(basketView, animated: true, completion: nil)
        
    }
    
    func nextScreen(){
        print("TEST IS")
        let Catalog = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "CatalogStory")
        Catalog.modalPresentationStyle = .fullScreen
        self.present(Catalog, animated: true, completion: nil)
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
