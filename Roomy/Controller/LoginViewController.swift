//
//  LoginViewController.swift
//  Roomy
//
//  Created by Mahmoud El-Melligy on 11/18/19.
//  Copyright © 2019 Mahmoud El-Melligy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userEmailTextField: UnderlineTextField!
    
    @IBOutlet weak var userPasswordTextField: UnderlineTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func forgetPasswordButtonPressed(_ sender: Any) {
    }
    
    @IBAction func signinButtonPressed(_ sender: Any) {
        if userEmailTextField.text == "" || userPasswordTextField.text == "" {
            displayAlert("Error in form","Please enter your email and passworld")
        }else{
            NetworkManger.shared.loginRequest(email: userEmailTextField.text! , password: userPasswordTextField.text!) { (error, success) in
                if success == true{
                    self.performSegue(withIdentifier: "goTohomePageFromLogin", sender: self)
                }else{
                    print(error!)
                }
            }
            
            
            
            
        }
    }
    //MARK:- performing seque
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goTohomePageFromLogin"{
            
        }
    }
    
    
}
extension LoginViewController{
    //MARK:- Helping Methods methods
    //Alert method
    func displayAlert(_ title : String,_ message : String ){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert,animated: true, completion: nil)
    }
}
