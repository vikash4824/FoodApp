//
//  UiTextFields.swift
//  Food_App
//
//  Created by vikash m on 27/07/21.
//

import UIKit

extension UITextField
{
    func designTextFlds(borderWidth: CGFloat = 1,borderColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) ){
        layer.cornerRadius = 10
        clipsToBounds = true
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}
