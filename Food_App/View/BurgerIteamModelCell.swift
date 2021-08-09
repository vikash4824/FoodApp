//
//  BurgerIteamModelCell.swift
//  Food_App
//
//  Created by vikash m on 04/08/21.
//

import Foundation
struct BurgerItemModel {
    var image = ""
    var name = ""
    var price = ""
    var ratingStar = ""
    var isHeartFav = Bool()
    
    init(image:String, name:String, price:String, ratingStar:String, isHeartFav:Bool) {
        self.image = image
        self.name = name
        self.price = price
        self.ratingStar = ratingStar
        self.isHeartFav = isHeartFav

    }
}
