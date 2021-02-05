//
//  ClosetModel.swift
//  Interview Task
//
//  Created by Ashok on 04/02/21.
//  Copyright © 2021 vijay. All rights reserved.
//


import Foundation
import ObjectMapper

class ClosetModel {
    var name : String
    var date : String
    var rate : String
    var rating : String
    var image : String
    var size : String
    var view : String
    var user_name : String
    var user_image:String

    init(name: String,date: String,rate :String,image: String,size: String,view:String,user_name :String,user_image :String,rating:String) {
        self.name = name
        self.date = date
        self.rate = rate
        self.rating = rating
        self.image = image
        self.size = size
        self.view = view
        self.user_name = user_name
        self.user_image = user_image
    }
}
