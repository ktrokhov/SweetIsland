//
//  NewLoginViewController.swift
//  SweetIsland
//
//  Created by Kirill Trokhov on 24.08.2020.
//  Copyright © 2020 Kirill. All rights reserved.
//

import UIKit

class NewRegistrationViewController: UIViewController {
    
    @IBOutlet weak var FullNameView: XibTest!
    @IBOutlet weak var EmailAddressView: XibTest!
    @IBOutlet weak var PhoneNumberView: XibTest!
    @IBOutlet weak var PasswordView: XibTest!
    @IBOutlet weak var RegistrationButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initXibViews()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func RegistrationButtonTapped(_ sender: Any) {
        print("Tapped")
        showNewView()
    }
    
    private func showNewView() {

        let loginView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "Test")
        
        loginView.modalPresentationStyle = .fullScreen
        self.present(loginView, animated: true, completion: nil)
    }
    
    private func initXibViews() {
        FullNameView.newLabel.text = "Full name"
        FullNameView.MyTextField.placeholder = "Full name"
        FullNameView.MyImageView.image = UIImage(named: "ProfileIcon")
        
        EmailAddressView.newLabel.text = "Email"
        EmailAddressView.MyTextField.placeholder = "Email address"
        EmailAddressView.MyImageView.image = UIImage(named: "Email")
        
        PhoneNumberView.MyTextField.placeholder = "Phone number"
        PhoneNumberView.MyImageView.image = UIImage(named: "Phone")
        PhoneNumberView.newLabel.text = "Phone number"
        
        PasswordView.newLabel.text = "Password"
        PasswordView.MyTextField.placeholder = "Password"
        PasswordView.MyImageView.image = UIImage(named: "Passwd")
        
    }
}
