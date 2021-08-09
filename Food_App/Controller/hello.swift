//
//  hello.swift
//  Food_App
//
//  Created by vikash m on 02/08/21.
//

import UIKit

class hello: UIViewController {

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Second VC will appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Second VC will disappear")
    }
    

}
