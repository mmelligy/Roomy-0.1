//
//  NewtworkManger.swift
//  Roomy
//
//  Created by Mahmoud El-Melligy on 11/18/19.
//  Copyright © 2019 mahmoud el melligy. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON



class NetworkManger{
    static let shared = NetworkManger()
    
    private init() {
        
    }
    
    //MARK:- Login Request
    func loginRequest(email: String, password: String,completion: @escaping(_ error: Error? ,_ success:  Bool)-> Void){
        Alamofire.request(NetworkRouter.AuthenticationRouter.login(email: email, password: password)).validate(statusCode: 200..<450).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let userToken = json["auth_token"].string{
                    saveUserTokenToUserDefaults(userToken: userToken)
                    completion(nil,true)
                }
            case .failure(let error):
                print(error)
                completion(error,false)
            }
        }
    }
    
    
    
    //MARK:- Sign Up Request
    func registerNewUserRequest(username: String, email: String, password: String,completion: @escaping(_ error: Error? ,_ success:  Bool)-> Void) {
        Alamofire.request(NetworkRouter.AuthenticationRouter.signup(username: username, email: email, password: password)).validate(statusCode: 200..<450).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let userToken = json["auth_token"].string{
                    saveUserTokenToUserDefaults(userToken: userToken)
                    completion(nil,true)
                }
            case .failure(let error):
                print(error)
                completion(error,false)
            }
            
        }
        
        
    }
    
    
    //MARK:- Getting all rooms Request
    func gettingRoomsRequest(userToken : String,completion: @escaping(_ error: Error? ,_ success:  Bool, _ getDailyVisits:[RoomsModel]?)-> Void)  {
        
        Alamofire.request(NetworkRouter.AuthenticationRouter.gettingRooms(userToken: userToken)).validate(statusCode: 200..<450).responseJSON(completionHandler: {
            response in
            print(response)
            switch (response.result) {
            case .success(let responseString1):
                let json: [String: Any] = [
                    "fakeKey": responseString1
                ]
                guard let gettingRoomsResponse = oomsArrayModel(JSON: json),
                    let rooms = gettingRoomsResponse.arrays else {
                        return
                }
                
                completion(nil,true,rooms)
                
            case .failure(let error):
                print (error)
                completion(error,false,nil)
                
            }
        })
        
        
        
    }
    
    //MARK:- Add Rooms Request
    
    
    
}
