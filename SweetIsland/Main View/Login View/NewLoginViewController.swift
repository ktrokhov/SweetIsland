//
//  NewLoginViewController.swift
//  SweetIsland
//
//  Created by Kirill Trokhov on 24.08.2020.
//  Copyright © 2020 Kirill. All rights reserved.
//

import UIKit

class NewLoginViewController: UIViewController {
    @IBOutlet weak var BackgroundImage: UIImageView!
    @IBOutlet weak var TestView: XibTest!
    override func viewDidLoad() {
        super.viewDidLoad()
        TestView.LabelView.text = "lol"
        TestView.TextFieldView.text = "kek"
        TestView.ImageView.image = UIImage(named: "Phone")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
