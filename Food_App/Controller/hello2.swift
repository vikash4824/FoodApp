//
//  hello2.swift
//  Food_App
//
//  Created by vikash m on 02/08/21.
//

import UIKit

class hello2: UIViewController {

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Third VC will appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Third VC will disappear")
    }

}
