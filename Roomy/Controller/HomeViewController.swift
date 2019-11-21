//
//  HomeViewController.swift
//  Roomy
//
//  Created by Mahmoud El-Melligy on 11/18/19.
//  Copyright © 2019 Mahmoud El-Melligy. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    let userToken = getUserToken()!
    var roomesArray = [RoomsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("usertoken in home page \(userToken)")
        
        NetworkManger.shared.gettingRoomsRequest(userToken: userToken){ (error, success,resevidRooms)  in
            if success == true{
                self.roomesArray = resevidRooms!
                self.table.reloadData()
            }else{
                print(error!)
            }
        }
    }
    
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    //MARK: - tableview Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(roomesArray.count)
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotelRoomCell") as? HotelRoomCell
        cell?.roomTitle.text = roomesArray[indexPath.row].title ?? ""
        cell?.roomPlace.text = roomesArray[indexPath.row].place ?? ""
        cell?.roomprice.text = roomesArray[indexPath.row].price ?? ""
        return cell!
    }
    
    //MARK:- tableview Deleget Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
}
