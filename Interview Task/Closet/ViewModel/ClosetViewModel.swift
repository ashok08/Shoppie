//
//  ClosetDataModel.swift
//  Interview Task
//
//  Created on 04/02/21.
//  Copyright © 2021 Ashok. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import SVProgressHUD
import ObjectMapper

class ClosetDataModel: NSObject
{
   
    func fetchCloset(onSuccess: @escaping ([ClosetModel]) -> Void){
        var closetArray = [ClosetModel]()
        let closet1 = ClosetModel(name: "Dress 1", date: "04 Feb 2021", rate: "$123", image: "dress1", size: "M", view: "2", user_name: "Manoj", user_image: "dress1", rating: "4.5")
        let closet2 = ClosetModel(name: "Dress 2", date: "04 Jul 2021", rate: "$12", image: "dress2", size: "M", view: "5", user_name: "Raja", user_image: "dress1", rating: "4.0")
        let closet3 = ClosetModel(name: "Dress 3", date: "04 Dev 2021", rate: "$23", image: "dress3", size: "M", view: "7", user_name: "Rahul", user_image: "dress1", rating: "4.0")
        let closet4 = ClosetModel(name: "Dress 4", date: "04 Nov 2021", rate: "$163", image: "dress1", size: "M", view: "8", user_name: "Arun", user_image: "dress10", rating: "4.0")
        let closet5 = ClosetModel(name: "Dress 5", date: "04 Aug 2021", rate: "$63", image: "dress4", size: "M", view: "8", user_name: "Ashwanth", user_image: "dress1", rating: "4.5")
        let closet6 = ClosetModel(name: "Dress 6", date: "0 Mar 2021", rate: "$7", image: "dress5", size: "M", view: "8", user_name: "Rajesh", user_image: "dress1", rating: "4.5")
        let closet7 = ClosetModel(name: "Dress 7", date: "08 Jun 2021", rate: "$66", image: "dress6", size: "M", view: "9", user_name: "Aswin", user_image: "dress1", rating: "4.5")
        let closet8 = ClosetModel(name: "Dress 8", date: "04 Apr 2021", rate: "$09", image: "dress7", size: "M", view: "0", user_name: "Jana", user_image: "dress1", rating: "4.0")
        let closet9 = ClosetModel(name: "Dress 9", date: "06 Jan 2021", rate: "$19", image: "dress8", size: "M", view: "1", user_name: "Ramesh", user_image: "dress1", rating: "4.0")
        let closet10 = ClosetModel(name: "Dress 10", date: "07 Feb 2021", rate: "$98", image: "dress9", size: "M", view: "5", user_name: "Ashok", user_image: "dress1", rating: "4.0")
        closetArray.append(closet1)
        closetArray.append(closet2)
        closetArray.append(closet3)
        closetArray.append(closet4)
        closetArray.append(closet5)
        closetArray.append(closet6)
        closetArray.append(closet7)
        closetArray.append(closet8)
        closetArray.append(closet9)
        closetArray.append(closet10)
          onSuccess(closetArray)
    }
    
}
