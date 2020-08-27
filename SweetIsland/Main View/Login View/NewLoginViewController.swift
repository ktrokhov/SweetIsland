//
//  NewLoginViewController.swift
//  SweetIsland
//
//  Created by Kirill Trokhov on 24.08.2020.
//  Copyright © 2020 Kirill. All rights reserved.
//

import UIKit

class NewLoginViewController: UIViewController {
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var EmailXib: XibTest!
    @IBOutlet weak var PasswordXib: XibTest!
    override func viewDidLoad() {
        super.viewDidLoad()
        ShowXibView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func registrationButtonTapped(_ sender: Any) {
        registrationView()
    }
    
    private func ShowXibView() {
        EmailXib.newLabel.text = "Email"
        EmailXib.MyTextField.placeholder = "Email address"
        EmailXib.MyImageView.image = UIImage(named: "Email")
        
        PasswordXib.newLabel.text = "Password"
        PasswordXib.MyTextField.placeholder = "Password"
        PasswordXib.MyImageView.image = UIImage(named: "Passwd")
    }
    
    private func registrationView() {
        let loginView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "RegistrationViewStory")
        loginView.modalPresentationStyle = .fullScreen
        self.present(loginView, animated: true, completion: nil)
    }
}
