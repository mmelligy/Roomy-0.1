//
//  LoginPresenterImplementation.swift
//  Roomy
//
//  Created by Mahmoud El-Melligy on 12/20/19.
//  Copyright © 2019 Mahmoud El-Melligy. All rights reserved.
//

import Foundation

protocol LoginPresenter {
    var view : LoginView! {get set}
    func networkRequest(email: String , password: String)
}

class LoginPresenterImplementation : LoginPresenter {
    
    weak var view : LoginView!
    
    
    func networkRequest(email: String , password: String){
        NetworkManger.shared.loginRequest(email: email, password: password) { (error, success) in
            if success == true{
                self.view.navigateTo()
                
            }else{
                print(error!)
                
            }  
        }
    }
    
    
    
    
}

