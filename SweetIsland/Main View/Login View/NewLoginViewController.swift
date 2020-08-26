//
//  NewLoginViewController.swift
//  SweetIsland
//
//  Created by Kirill Trokhov on 24.08.2020.
//  Copyright © 2020 Kirill. All rights reserved.
//

import UIKit

class NewLoginViewController: UIViewController {

    @IBOutlet weak var LoginView: UIView!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var BackgroundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginView.layer.cornerRadius = 25
        LoginButton.layer.cornerRadius = 20
//        LoginButton.backgroundColor = UIColor(rgb: 0xFF88A8)
        BackgroundImage.contentMode = .scaleAspectFill
        // Do any additional setup after loading the view.
    }

}
