//
//  Extension.swift
//  Interview Task
//
//  Created by Ashok on 04/02/21.
//  Copyright © 2021 vijay. All rights reserved.
//

import UIKit
import Foundation

//MARK: - UITableView
extension UITableView{
    func dequeue<T>(_ identifier :String, _ OfClass :T.Type) -> T{
        var cell = self.dequeueReusableCell(withIdentifier: identifier) as? T
        if cell == nil{
            self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
            cell = self.dequeueReusableCell(withIdentifier: identifier) as? T
        }
        return cell!
    }
}
//MARK: - Array
extension Array where Element: Hashable {

    func removeDuplicates<T: Hashable>(byKey key: (Element) -> T)  -> [Element] {
         var result = [Element]()
         var seen = Set<T>()
         for value in self {
             if seen.insert(key(value)).inserted {
                 result.append(value)
             }
         }
         return result
     }

}
