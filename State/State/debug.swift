//
//  Debug.swift
//  State
//
//  Created by Mendy Edri on 20/05/2019.
//  Copyright © 2019 Mendy Edri. All rights reserved.
//

import Foundation

class debug {
    static func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        Swift.print(items[0], separator:separator, terminator: terminator)
    }
}
