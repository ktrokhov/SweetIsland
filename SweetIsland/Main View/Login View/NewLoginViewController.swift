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

class NewLoginViewController: UIViewController {
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var EmailXib: XibTest!
    @IBOutlet weak var PasswordXib: XibTest!
    @IBOutlet weak var ButtonCustomize: UIButton!
    
    //MARK: - Vars
    
    let hud = JGProgressHUD(style: .dark)
    var activityIdicator: NVActivityIndicatorView?

    
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
    @IBAction func LoginButtonTapped(_ sender: Any) {
        if textFieldsHaveText() {
                   
                   loginUser()
               } else {
                   hud.textLabel.text = "All fields are required"
                   hud.indicatorView = JGProgressHUDErrorIndicatorView()
                   hud.show(in: self.view)
                   hud.dismiss(afterDelay: 2.0)
               }
        
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
    
        private func loginUser() {
            
            showLoadingIdicator()
            
            MUser.loginUserWith(email: EmailXib.MyTextField.text!, password: PasswordXib.MyTextField.text!) { (error, isEmailVerified) in
                
                if error == nil {
                    
                    if  isEmailVerified {
//                        self.dismissView()
                        print("Email is verified")
                        let loginView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "InfoAboutProfileStroy")
                        loginView.modalPresentationStyle = .fullScreen
                        self.present(loginView, animated: true, completion: nil)
                    } else {
                        self.hud.textLabel.text = "Please Verify your email!"
                        self.hud.indicatorView = JGProgressHUDErrorIndicatorView()
                        self.hud.show(in: self.view)
                        self.hud.dismiss(afterDelay: 2.0)
                        //добавить кнопку забыли пароль
//                        self.resendButtonOutlet.isHidden = false
                    }

                } else {
                    print("error loging in the iser", error!.localizedDescription)
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
    //проверка на пустоту
    private func textFieldsHaveText() -> Bool {
           return (EmailXib.MyTextField.text != "" && PasswordXib.MyTextField.text != "")
       }
}
