//
//  LoginViewController.swift
//  Roomy
//
//  Created by Mahmoud El-Melligy on 11/18/19.
//  Copyright © 2019 Mahmoud El-Melligy. All rights reserved.
//

import UIKit

protocol LoginView : AnyObject {
    var presenter : LoginPresenter! {get set}
    func navigateTo()
    
}

class LoginViewController: UIViewController, LoginView {
  
    func navigateTo() {
        self.performSegue(withIdentifier: "goTohomePageFromLogin", sender: self)
    }
   
    @IBOutlet weak var userEmailTextField: UnderlineTextField!
    @IBOutlet weak var userPasswordTextField: UnderlineTextField!
    
    var presenter : LoginPresenter!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = LoginPresenterImplementation()
        presenter.view = self
        
    }
    
    @IBAction func forgetPasswordButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func signinButtonPressed(_ sender: Any) {
        guard let email = userEmailTextField.text , !email.isEmpty else {
            displayAlert("Error in form","Please enter your email ")
            return}
        guard let password = userPasswordTextField.text , !password.isEmpty else {
            displayAlert("Error in form","Please enter your  passworld")
            return}
        
         presenter.networkRequest(email: email , password: password)
        
        
        
    }
    
    //MARK:- performing seque
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goTohomePageFromLogin"{
        }
    }  
}

extension LoginViewController{
    //MARK:- Helping Methods methods
    func displayAlert(_ title : String,_ message : String ){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert,animated: true, completion: nil)
    }
}
