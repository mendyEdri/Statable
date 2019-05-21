//
//  Hotels.swift
//  State
//
//  Created by Mendy Edri on 25/04/2019.
//  Copyright © 2019 Mendy Edri. All rights reserved.
//

import Foundation

struct Hotel {
    var name: String
    var city: String
}

struct Price {
    var currency: String
    var value: Int
}

class Hotels: Statable {    
    static var shared: Hotels = Hotels.init()
    
    // binding - optional
    var array: [Hotel] = [] {
        didSet {
            observableHotels.value = array
        }
    }
    
    var prices: [Price] = [] {
        didSet {
            observablePrices.value = prices
        }
    }
    
    deinit {
        debug.print("hotel deinit")
    }

    // define your data source
    lazy private var observableHotels = Observable<[Hotel]>.init([], instance: self)
    lazy private var observablePrices = Observable<[Price]>.init([], instance: self)
}
