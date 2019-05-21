//
//  Closure.swift
//  State
//
//  Created by Mendy Edri on 19/05/2019.
//  Copyright © 2019 Mendy Edri. All rights reserved.
//

import Foundation

class Closure {
    let closure: Statable.ClosureType
    init(_ closure: @escaping Statable.ClosureType) {
        self.closure = closure
    }
    
    func invoke(with object: AnyObject) {
        closure(object)
    }
    
    deinit {
        debug.print("Closure deinit")
    }
}
