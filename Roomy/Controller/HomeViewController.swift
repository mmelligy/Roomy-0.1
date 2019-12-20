//
//  HomeViewController.swift
//  Roomy
//
//  Created by Mahmoud El-Melligy on 11/18/19.
//  Copyright © 2019 Mahmoud El-Melligy. All rights reserved.
//

import UIKit

protocol HomeView : AnyObject {
    func reloadData()
    
}



class HomeViewController: UIViewController, HomeView {
    
    var presenter: HomePresenter!
    
    @IBOutlet weak var table: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = HomePresenterImplementation()
        presenter.view = self
        
        presenter.getRoomsRequest(){(error, success) in
            
        }
        
    }
    func reloadData() {
        self.table.reloadData()
    }
    
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    //MARK: - tableview Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.presenterGetNumberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotelRoomCell") as? HotelRoomCell
        let room = presenter.presenterGetitemAtindexPath(indexPath: indexPath.row)
        cell?.roomTitle.text = room.title ?? ""
        cell?.roomPlace.text = room.place ?? ""
        cell?.roomprice.text = room.price ?? ""
        
        return cell!
    }
    
    //MARK:- tableview Deleget Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
}
