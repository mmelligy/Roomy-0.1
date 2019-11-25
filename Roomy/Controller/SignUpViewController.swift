//
//  SignUpViewControllerViewController.swift
//  Roomy
//
//  Created by Mahmoud El-Melligy on 11/18/19.
//  Copyright © 2019 Mahmoud El-Melligy. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var userNameTextFeild: UnderlineTextField!
    @IBOutlet weak var userEmailTextField: UnderlineTextField!
    @IBOutlet weak var userPasswordTextField: UnderlineTextField!
    
    var userToken = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    //MARK:- Add New User
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
        guard let username = userNameTextFeild.text , !username.isEmpty else {
            displayAlert("Error in form","Please enter your  user name")
            return}
        guard let email = userEmailTextField.text , !email.isEmpty else {
            displayAlert("Error in form","Please enter your email ")
            return}
        guard let password = userPasswordTextField.text , !password.isEmpty else {
            displayAlert("Error in form","Please enter your  passworld")
            return}
        
        
        NetworkManger.shared.registerNewUserRequest(username: username, email: email, password: password) { (error, success) in
            if success == true{
                self.performSegue(withIdentifier: "goTohomePageFromSignup", sender: self)
            }else{
                print(error!)
                
            }
        }
    }
    //MARK:- performing seque
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is HomeViewController {
            
        }
    }
    
}

extension SignUpViewController{
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
