//
//  NetworkRouter.swift
//  Roomy
//
//  Created by mahmoud el melligy on 11/17/19.
//  Copyright © 2019 Mahmoud El-Melligy. All rights reserved.
//

import Foundation
import Alamofire


class NetworkRouter{
    enum AuthenticationRouter: URLRequestConvertible {
        case login(email: String, password: String)
        case signup(username: String, email: String, password: String)
        case gettingRooms(userToken : String)
        
        func asURLRequest() throws -> URLRequest {
            let url:URL = {
                switch self {
                case .login:
                    return URL(string: URL_LOGIN)!
                case .signup:
                    return URL(string: URL_SIGNUP)!
                case .gettingRooms:
                    return URL(string: URL_ROOMS)!
                }
            }()
            
            let method : HTTPMethod = {
                switch self {
                case .login, .signup:
                    return .post
                case .gettingRooms:
                    return .get
                }
            }()
            
            let parameters:[String:Any]? = {
                switch self{
                case .login(let email,let password):
                    return  [
                        "email":email,
                        "password":password
                    ]
                case .signup(let username, let email, let password):
                    return   [
                        "name":username,
                        "email":email,
                        "password":password
                    ]
                case .gettingRooms:
                    return nil
                }
            }()
            
            
            var urlRequest : URLRequest {
                switch self {
                case .gettingRooms(let userToken):
                    var urlRequest = try! URLRequest(url: url,method: method)
                    urlRequest.addValue(userToken, forHTTPHeaderField: "Authorization")
                    return urlRequest
                case .login:
                    return try! URLRequest(url: url,method: method)
                case .signup:
                    return try! URLRequest(url: url,method: method)
                }
            }
            
            let encoding : ParameterEncoding = JSONEncoding.default
            return try! encoding.encode(urlRequest, with: parameters)
        }
        
    }
}
