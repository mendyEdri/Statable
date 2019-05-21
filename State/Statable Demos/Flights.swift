//
//  Flights.swift
//  State
//
//  Created by Mendy Edri on 26/04/2019.
//  Copyright © 2019 Mendy Edri. All rights reserved.
//

import Foundation

struct Flight {
    var airline: String
    var flightNumber: Int
}

class Flights: Statable {
    static var shared: Flights = Flights.init()
    lazy private var observables: Observable<[Flight]> = Observable.init([], instance: self)
    
    var flights: [Flight] = [] {
        didSet {
            observables.value = flights
        }
    }
}
