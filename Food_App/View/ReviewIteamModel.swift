//
//  ReviewIteamModel.swift
//  Food_App
//
//  Created by vikash m on 02/08/21.
//

import Foundation


struct ReviewItemModel {
    var image = ""
    var name = ""
    var date = ""
    var review = ""
    
    
    init(image:String, name:String, date:String, review:String) {
        self.image = image
        self.name = name
        self.date = date
        self.review = review

    }
}
