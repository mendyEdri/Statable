//
//  Observable.swift
//  State
//
//  Created by Mendy Edri on 19/05/2019.
//  Copyright © 2019 Mendy Edri. All rights reserved.
//

import Foundation

class Observable<T> {
    var value: T {
        didSet {
            guard let address = instance?.memoryAddress else { return }
            let state = StatesContainer.shared.state(for: address)
            state.iterate(address)
        }
    }
    
    var instance: Statable?
    var isAttached: Bool {
        return instance != nil
    }
    
    // designated init
    init(_ v: T, instance: Statable?) {
        value = v
        
        guard let instance = instance else { return }
        self.instance = instance
    }
    
    convenience init(_ v: T) {
        self.init(v, instance: nil)
    }
    
    func attach(_ instance: Statable) {
        self.instance = instance
    }
    
    deinit {
        debug.print("Observable deinit")
    }
}
