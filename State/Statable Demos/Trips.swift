//
//  Trips.swift
//  State
//
//  Created by Mendy Edri on 26/04/2019.
//  Copyright © 2019 Mendy Edri. All rights reserved.
//

import Foundation

struct Trip {
    var destination: String
}

class Trips: Statable {
    static var shared = Trips()
    //lazy var trips = Observable<[Trip]>.init([], instance: self)
    var trips: Observable<[Trip]>
    
    init() {
        trips = Observable([])
        trips.attach(self)
    }
}
