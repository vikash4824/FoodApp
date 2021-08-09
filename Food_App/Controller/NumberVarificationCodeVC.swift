//
//  NumberVarificationCodeVC.swift
//  Food_App
//
//  Created by vikash m on 27/07/21.
//

import UIKit

class NumberVarificationCodeVC: UIViewController {

   
   //Marks - outlets
    @IBOutlet weak var nr1Tft: UITextField!
    @IBOutlet weak var verftBtn: UIButton!
    @IBOutlet weak var nr2Tft: UITextField!
    @IBOutlet weak var nr3Tft: UITextField!
    @IBOutlet weak var nr4Tft: UITextField!
    
    //Marks - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        nr1Tft.designTextFlds()
        nr2Tft.designTextFlds()
        nr3Tft.designTextFlds()
        nr4Tft.designTextFlds()
        verftBtn.designButton()
       
      
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = true
    }
}
//Marks - Action
extension NumberVarificationCodeVC
{
    
    @IBAction func verftBtn(_ sender: Any) {
        
            let vc = storyboard?.instantiateViewController(withIdentifier: "LoginVC")as! LoginVC
                  self.navigationController?.pushViewController(vc, animated: true)
            
    }
}
