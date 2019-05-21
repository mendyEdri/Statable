//
//  Navigator.swift
//  State
//
//  Created by Mendy Edri on 25/04/2019.
//  Copyright © 2019 Mendy Edri. All rights reserved.
//

import Foundation
import UIKit

struct Navigator {
    static let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
    
    static func addHotel() {
        let nextVC = Navigator.storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        Navigator.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    static func hotelAdded() {
        Navigator.navigationController?.popViewController(animated: true)
    }

    static var topViewController: UIViewController? {
        return UIApplication.shared.delegate?.window??.rootViewController
    }
    
    private static var navigationController: UINavigationController? {
        let navigation = UIApplication.shared.delegate?.window??.rootViewController
        return navigation as? UINavigationController
    }
    
}
