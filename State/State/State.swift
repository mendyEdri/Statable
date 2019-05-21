//
//  State.swift
//  State
//
//  Created by Mendy Edri on 20/04/2019.
//  Copyright © 2019 Mendy Edri. All rights reserved.
//

import Foundation

protocol Statable {
    typealias ClosureType = (Any) -> (Void)
}

private extension UInt32 {
    func timedRandom() -> UInt32 {
        return arc4random()
    }
    
    var description: String {
        return String(format: "[%d]", timedRandom())
    }
}

extension Statable {
    func update(_ caller: AnyObject, _ block: @escaping ClosureType) {
        let state: State = StatesContainer.shared.state(for: self.memoryAddress)
        
        let closure = Closure(block)
        associtateInMemory(closure: closure, asLong: caller)
        state.onChange(closure, statable: self as AnyObject, memoryAddress: self.memoryAddress)
    }
    
    private func associtateInMemory(closure: Closure, asLong asObject: AnyObject) {
        objc_setAssociatedObject(asObject, UInt32().timedRandom().description, closure, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
    var memoryAddress: String  {
        return "\(Unmanaged.passUnretained(self as AnyObject).toOpaque())"
    }
}

class State {
    static var shared = State()
    private var handlers = [String: [Item]]()
    
    fileprivate func onChange(_ closureObj: Closure, statable: AnyObject, memoryAddress: String) {
        let observer = Item(instance: statable, closure: Weak(value: closureObj))
        
        append(observer, to: memoryAddress)
    }
 
   
    
    private func append(_ observer: Item, to key: String) {
        if handlers[key] == nil {
            handlers[key] = []
        }
        handlers[key]?.append(observer)    
    }
    
    func iterate(_ address: String) {
        if let arr = handlers[address] {
            arr.forEach { observer in
                observer.closure.value?.invoke(with: observer.instance)
            }
            //handlers[address]?.reap()
        }
    }
}
