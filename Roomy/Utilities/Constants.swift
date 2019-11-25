//
//  Constants.swift
//  Roomy
//
//  Created by mahmoud el melligy on 11/13/19.
//  Copyright © 2019 Mahmoud El-Melligy. All rights reserved.
//

import Foundation
import UIKit

//https://roomy-application.herokuapp.com/auth/login
//https://roomy-application.herokuapp.com/signup
//https://roomy-application.herokuapp.com/rooms
//https://roomy-application.herokuapp.com/rooms

struct Utilities {
    //MARK:- URL's
    static let BASE_URL = "https://roomy-application.herokuapp.com"
    ///post {email,password}
    static let URL_LOGIN = BASE_URL + "/auth/login"
    //Post {username,email,password}
    static let URL_SIGNUP = BASE_URL + "/signup"
    ///getting rooms Post {token}  OR  creatingroom Get {“title”: “”, “place”: “”, “price”: “”,“description”: “”, “image”: “”}
    static let URL_ROOMS = BASE_URL + "/rooms"
}


//Mark:- saveing usertoken to userdefaults
let defaults = UserDefaults.standard
struct KeysForUserDefaults {
    static let userToken = "userToken"
}
func saveUserTokenToUserDefaults(userToken : String) {
    defaults.set(userToken, forKey: KeysForUserDefaults.userToken)
    defaults.synchronize()
}
func getUserToken() ->String?{
    let userToken = defaults.object(forKey: KeysForUserDefaults.userToken) as? String
    if userToken != nil {
        return userToken
    }else {
        return "don't have userToken"
    }
}
