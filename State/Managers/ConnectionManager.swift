//
//  Some.swift
//  State
//
//  Created by Mendy Edri on 20/04/2019.
//  Copyright © 2019 Mendy Edri. All rights reserved.
//

import Foundation
import UIKit

class ConnectionManager {
    
    var presenting = false
    
    init() {
        Hotels.shared.update(self) {_ in
            debug.print("ConnectionManager: hotels has been update")
        }
    }
    
    deinit {
        debug.print("connection deinit")
    }
    
    func showAlert() {
        if presenting {
            return
        }
        presenting = true
        let alert = UIAlertController.init(title: "Thanks for adding a hotel", message: "Would you like to add another one and help us built our hotel network?", preferredStyle: .alert)
        
        let okAction = UIAlertAction.init(title: "OK", style: .default) { (action) in
            debug.print("cancel")
            self.presenting = false
        }
        
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel) { (action) in
            debug.print("cancel")
            self.presenting = false
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        Navigator.topViewController?.present(alert, animated: true, completion: nil)
    }
}
