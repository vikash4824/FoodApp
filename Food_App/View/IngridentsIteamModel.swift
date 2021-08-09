//
//  IngridentsIteamModel.swift
//  Food_App
//
//  Created by vikash m on 02/08/21.
//

import Foundation


struct IngridentsItemModel {
    var image = ""
    var name = ""
    var quantity = ""
    
    
    init(image:String, name:String, quantity:String) {
        self.image = image
        self.name = name
        self.quantity = quantity
        

    }
}
