//
//  NewLoginViewController.swift
//  SweetIsland
//
//  Created by Kirill Trokhov on 24.08.2020.
//  Copyright © 2020 Kirill. All rights reserved.
//

import UIKit
import JGProgressHUD
import NVActivityIndicatorView

class NewRegistrationViewController: UIViewController {
    
    @IBOutlet weak var FullNameView: XibTest!
    @IBOutlet weak var EmailAddressView: XibTest!
    @IBOutlet weak var PhoneNumberView: XibTest!
    @IBOutlet weak var PasswordView: XibTest!
    @IBOutlet weak var RegistrationButton: UIButton!
    
    //MARK: - Vars
    
    let hud = JGProgressHUD(style: .dark)
    var activityIdicator: NVActivityIndicatorView?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initXibViews()
        RegistrationButton.layer.cornerRadius = 10
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func BackToLoginViewButton(_ sender: Any) {
        dismissView()
    }
    @IBAction func RegistrationButtonTapped(_ sender: Any) {
        print("Tapped")
        print("register")
                
                if textFieldsHaveText() {
                    
                    registerUser()
//                    redirectToLogin()
                } else {
                    hud.textLabel.text = "All fields are required"
                    hud.indicatorView = JGProgressHUDErrorIndicatorView()
                    hud.show(in: self.view)
                    hud.dismiss(afterDelay: 2.0)
                }

    }
    
    @IBAction func PasswordSecret(_ sender: Any) {
        PasswordView.MyTextField.isSecureTextEntry.toggle()
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
        PasswordView.MyTextField.isSecureTextEntry = true
        PasswordView.MyTextField.placeholder = "Password"
        PasswordView.MyImageView.image = UIImage(named: "Passwd")
        
    }
    
    //MARK: - Register User
    
    private func registerUser() {
        
        showLoadingIdicator()
        
        MUser.registerUserWith(email: EmailAddressView.MyTextField.text!, password: PasswordView.MyTextField.text!) { (error) in
            
            if error == nil {
                self.hud.textLabel.text = "Varification Email sent!"
                self.hud.indicatorView = JGProgressHUDSuccessIndicatorView()
                self.hud.show(in: self.view)
                self.hud.dismiss(afterDelay: 2.0)
//                self.redirectToLogin()
            } else {
                print("error registering", error!.localizedDescription)
                self.hud.textLabel.text = error!.localizedDescription
                self.hud.indicatorView = JGProgressHUDErrorIndicatorView()
                self.hud.show(in: self.view)
                self.hud.dismiss(afterDelay: 2.0)
            }
            
            
            self.hideLoadingIdicator()
        }
        
    }
    //MARK: - Activity Indicator
    
    private func showLoadingIdicator() {
        
        if activityIdicator != nil {
            self.view.addSubview(activityIdicator!)
            activityIdicator!.startAnimating()
        }
        
    }
    private func hideLoadingIdicator() {
        
        if activityIdicator != nil {
            activityIdicator!.removeFromSuperview()
            activityIdicator!.stopAnimating()
        }
    }
    
    private func textFieldsHaveText() -> Bool {
        return (EmailAddressView.MyTextField.text != "" && PasswordView.MyTextField.text != "")
    }
    private func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func redirectToLogin() {
        print("HEllo")
        let loginView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginViewStory")
        loginView.modalPresentationStyle = .fullScreen
        self.present(loginView, animated: true, completion: nil)
    }

}
