//
//  NewItemViewController.swift
//  SweetIsland
//
//  Created by Kirill Trokhov on 28.08.2020.
//  Copyright © 2020 Kirill. All rights reserved.
//

import UIKit
import JGProgressHUD
import GoogleMobileAds

class NewItemViewController: UIViewController {

    @IBOutlet weak var ImageCollection: UICollectionView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var Description: UITextView!
    @IBOutlet weak var AddToBasket: UIButton!
    
    //MARK: - Vars
     var item: Item!
     var itemImages: [UIImage] = []
     let hud = JGProgressHUD(style: .dark)

     private let sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
     private let cellHeight : CGFloat = 196.0
     private let itemsPerRow: CGFloat = 1

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        downloadPictures()
        AddToBasket.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Download Pictures
       
       private func downloadPictures() {
           
           if item != nil && item.imageLinks != nil {
               downloadImages(imageUrls: item.imageLinks) { (allImages) in
                   if allImages.count > 0 {
                       self.itemImages = allImages as! [UIImage]
                       self.ImageCollection.reloadData()
                   }
               }
           }
       }

       
       //MARK: - Setup UI
       
       private func setupUI() {
           
           if item != nil {
               self.title = item.name
               NameLabel.text = item.name
               PriceLabel.text = convertToCurrency(item.price)
               Description.text = item.description
               Description.isEditable = false
           }
           
       }
    

    @IBAction func BasketTapped(_ sender: Any) {
        if MUser.currentUser() != nil {
            
            downloadBasketFromFirestore(MUser.currentId()) { (basket) in

                if basket == nil {
                    self.createNewBasket()
                } else {
                    basket!.itemIds.append(self.item.id)
                    self.updateBasket(basket: basket!, withValues: [kITEMIDS : basket!.itemIds])
                }
            }

        } else {
            showLoginView()
        }
    }
    
    private func createNewBasket() {
           
           let newBasket = Basket()
           newBasket.id = UUID().uuidString
           newBasket.ownerId = MUser.currentId()
           newBasket.itemIds = [self.item.id]
           saveBasketToFirestore(newBasket)
           
           self.hud.textLabel.text = "Added to basket!"
           self.hud.indicatorView = JGProgressHUDSuccessIndicatorView()
           self.hud.show(in: self.view)
           self.hud.dismiss(afterDelay: 2.0)
       }
       
       private func updateBasket(basket: Basket, withValues: [String : Any]) {
           
           updateBasketInFirestore(basket, withValues: withValues) { (error) in
               
               if error != nil {
                   
                   self.hud.textLabel.text = "Error: \(error!.localizedDescription)"
                   self.hud.indicatorView = JGProgressHUDErrorIndicatorView()
                   self.hud.show(in: self.view)
                   self.hud.dismiss(afterDelay: 2.0)

                   print("error updating basket", error!.localizedDescription)
               } else {
                   
                   self.hud.textLabel.text = "Added to basket!"
                   self.hud.indicatorView = JGProgressHUDSuccessIndicatorView()
                   self.hud.show(in: self.view)
                   self.hud.dismiss(afterDelay: 2.0)
               }
           }
       }
 
    
    //MARK: - Show login view
    
    private func showLoginView() {
        
        let loginView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginViewStory")
        
        self.present(loginView, animated: true, completion: nil)
    }

}

