//
//  Item.swift
//  State
//
//  Created by Mendy Edri on 19/05/2019.
//  Copyright © 2019 Mendy Edri. All rights reserved.
//

import Foundation

class Item {
    var instance: AnyObject
    var closure: Weak<Closure>
    
    init(instance: AnyObject, closure: Weak<Closure>) {
        self.instance = instance
        self.closure = closure
    }
    deinit {
        debug.print("Item deinit")
    }
}

extension Array where Element:Item {
    mutating func reap () {
        self = self.filter { nil != $0.closure.value }
    }
}
