//
//  AddHotelViewController.swift
//  State
//
//  Created by Mendy Edri on 25/04/2019.
//  Copyright © 2019 Mendy Edri. All rights reserved.
//

import UIKit

class AddHotelViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save(_ sender: UIButton) {
        createHotel()
    }
    
    func createHotel() {
        let hotel = Hotel.init(name: nameTextField.text ?? "", city: cityTextField.text ?? "")
        let price = Price.init(currency: "$", value: Int(priceTextField.text ?? "0") ?? 0)
        
        Hotels.shared.array.append(hotel)
        Hotels.shared.prices.append(price)
        
        Navigator.hotelAdded()
    }
}
