//
//  ViewController.swift
//  State
//
//  Created by Mendy Edri on 20/04/2019.
//  Copyright © 2019 Mendy Edri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var connection: ConnectionManager? = ConnectionManager()
    var hotels: Hotels? = Hotels.init()
    var prices: [Price] = []
    var hotelsArr: [Hotel] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onHotelChange()
    }
    
    var dictionary: [String: Array<String>] = [:]
    
    private func onHotelChange() {
        
        hotels?.update(self) { [weak self] hotels in
            let state = hotels as! Hotels
            self?.prices = state.prices
            self?.hotelsArr = state.array
            self?.tableView.reloadData()
            debug.print("VC: hotelState2 has been updated")
        }
        
        hotels?.update(self) { (_) -> (Void) in
            debug.print("VC: hotelState2 has been updated")
        }
        
        Flights.shared.update(self) { obj in
            debug.print("VC: Flights \(obj)")
        }
    }
    
    @IBAction func addHotel(_ sender: UIBarButtonItem) {
        //connection = nil
        //updater = nil
        //hotelState = nil
        
        let hotel = Hotel.init(name: "Hilon", city: "London")
        let price = Price(currency: "$", value: 120)
        
        hotels?.array.append(hotel)
        hotels?.prices.append(price)
        
        Hotels.shared.array.append(hotel)
        Hotels.shared.prices.append(price)
    }
}







extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotelsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotelTableViewCell") as! HotelTableViewCell
        // to use the singleton option, uncomment this line
        //cell.model = (Hotels.shared.array[indexPath.row], Hotels.shared.prices[indexPath.row])
        cell.model = (hotelsArr[indexPath.row], prices[indexPath.row])
        return cell
    }
    
}
