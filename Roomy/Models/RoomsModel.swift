//
//  GettingRoomsModel.swift
//  Roomy
//
//  Created by mahmoud el melligy on 11/13/19.
//  Copyright © 2019 Mahmoud El-Melligy. All rights reserved.
//

import Foundation
import ObjectMapper

class oomsArrayModel: Mappable{
    var arrays : [RoomsModel]?
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        arrays <- map["fakeKey"]
    }
}

class RoomsModel : Mappable {
    
    var createdAt : String?
    var descriptionField : String?
    var id : Int?
    var image : String?
    var place : String?
    var price : String?
    var title : String?
    var updatedAt : String?
    
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        createdAt <- map["created_at"]
        descriptionField <- map["description"]
        id <- map["id"]
        image <- map["image"]
        place <- map["place"]
        price <- map["price"]
        title <- map["title"]
        updatedAt <- map["updated_at"]
        
    }
    
}
