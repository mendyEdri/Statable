//
//  DataSource.swift
//  State
//
//  Created by Mendy Edri on 19/05/2019.
//  Copyright © 2019 Mendy Edri. All rights reserved.
//

import Foundation

class StatesContainer {
    var source: [String: State] = [:]
    static let shared = StatesContainer()
    
    func state(for key: String) -> State {
        var state: State
        if source[key] == nil {
            state = State.init()
            source[key] = state
        } else {
            state = source[key]!
        }
        return state
    }
}

