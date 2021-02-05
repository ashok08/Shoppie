//
//  Utilities.swift
//  Interview Task
//
//  Created by Ashok on 04/02/21.
//  Copyright © 2021 vijay. All rights reserved.
//

import Foundation
import UIKit
class Utilities: NSObject {
    
    static let shared = Utilities()
    
    
    //MARK: -InitiateViewController
    func instantiateViewController<T>(_ storyboard:String, _ identifier:String, ofClass: T.Type) -> T{
        let controller = UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: identifier) as? T
        return controller!
    }

    
}
