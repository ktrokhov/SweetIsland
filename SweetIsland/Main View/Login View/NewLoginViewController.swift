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
    @IBOutlet weak var ButtonCustomize: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        ButtonCustomize.layer.cornerRadius = 10
        ShowXibView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func registrationButtonTapped(_ sender: Any) {
        registrationView()
    }
    
    @IBAction func secretEyeForPasswd(_ sender: Any) {
        PasswordXib.MyTextField.isSecureTextEntry.toggle()
    }
    
    private func ShowXibView() {
        EmailXib.newLabel.text = "Email"
        EmailXib.MyTextField.placeholder = "Email address"
        EmailXib.MyImageView.image = UIImage(named: "Email")
        
        PasswordXib.MyTextField.isSecureTextEntry = true
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
