//
//  HotelTableViewCell.swift
//  State
//
//  Created by Mendy Edri on 25/04/2019.
//  Copyright © 2019 Mendy Edri. All rights reserved.
//

import UIKit

class HotelTableViewCell: UITableViewCell {

    @IBOutlet weak var hotelImage: UIImageView!
    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var hotelCity: UILabel!
    @IBOutlet weak var hotelPrice: UILabel!
    
    typealias Model = (hotel: Hotel, price: Price)
    var model: Model! {
        didSet {
            hotelName.text = model.hotel.name
            hotelCity.text = model.hotel.city
            hotelPrice.text = model.price.currency + String(model.price.value)
        }
    }
    
}
