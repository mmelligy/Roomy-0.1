//
//  HomePresenter.swift
//  Roomy
//
//  Created by Mahmoud El-Melligy on 12/20/19.
//  Copyright © 2019 Mahmoud El-Melligy. All rights reserved.
//


import Foundation

protocol HomePresenter {
    var view : HomeView! {get set}
    func getRoomsRequest(completion: @escaping(_ error: Error? ,_ success:  Bool)-> Void)
    func presenterGetitemAtindexPath(indexPath:Int)->RoomsModel
    func presenterGetNumberOfItems() -> Int
}

class HomePresenterImplementation : HomePresenter {
    
    private var roomesArray = [RoomsModel]()
    
    weak var view: HomeView!
    
    
    func getRoomsRequest(completion: @escaping (Error?, Bool) -> Void) {
        guard let userToken = keychainKeys.getUserToken() else{return}
        
        NetworkManger.shared.gettingRoomsRequest(userToken: userToken){ (error, success,resevidRooms)  in
            if success == true{
                self.roomesArray = resevidRooms!
                self.view.reloadData()
                completion(nil,true)
            }else{
                print(error!)
                completion(error,false)
            }
        }
    }
    

    func presenterGetNumberOfItems() -> Int {
        return roomesArray.count
    }
    
    func presenterGetitemAtindexPath(indexPath: Int)->RoomsModel {
        return roomesArray[indexPath]
    }
    
   
    
    
    
}
