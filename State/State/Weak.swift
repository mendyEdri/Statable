//
//  Weak.swift
//  State
//
//  Created by Mendy Edri on 19/05/2019.
//  Copyright © 2019 Mendy Edri. All rights reserved.
//

import Foundation

class Weak<T: AnyObject> {
    weak var value : T?
    init (value: T) {
        self.value = value
    }
    
    deinit {
        debug.print("Weak deinit")
    }
}
