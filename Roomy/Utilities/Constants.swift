//
//  Constants.swift
//  Roomy
//
//  Created by mahmoud el melligy on 11/13/19.
//  Copyright © 2019 Mahmoud El-Melligy. All rights reserved.
//

import Foundation
import UIKit
import KeychainSwift

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

struct keychainKeys {
    //Mark:- saveing usertoken in keychain
    static let keychain = KeychainSwift(keyPrefix: "userToken_")
    
    static func saveUserTokenToKeyChain(userToken : String) {
        keychain.set(userToken, forKey: "userToken")
    }
    static func getUserToken() ->String?{
        let userToken = keychain.get("userToken")
        if userToken != nil {
            return userToken
        }else {
            return "don't have userToken"
        }
    }
}

