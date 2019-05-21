//
//  Users.swift
//  State
//
//  Created by Mendy Edri on 25/04/2019.
//  Copyright © 2019 Mendy Edri. All rights reserved.
//

import Foundation

struct User {
    var name: String
    var age: Int
}

class Users: Statable {
    var state: State = State.init()
    
    static var shared: Users = Users()
    
    var array: [User] = [] {
        didSet {
            observable.value = array
        }
    }
    
    lazy var observable = Observable<[User]>([], instance: self)
}
