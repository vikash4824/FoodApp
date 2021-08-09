//
//  ItemModel.swift
//  Food_App
//
//  Created by vikash m on 29/07/21.
//

import Foundation


struct ItemModel {
    var image = ""
    var name = ""
    var price = ""
    var ratingStar = ""
    var isFav = Bool()
    
    init(image:String, name:String, price:String, ratingStar:String, isFav:Bool) {
        self.image = image
        self.name = name
        self.price = price
        self.ratingStar = ratingStar
        self.isFav = isFav

    }
}
