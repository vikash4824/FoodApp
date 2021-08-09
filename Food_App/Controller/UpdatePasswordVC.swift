//
//  UpdatePasswordVC.swift
//  Food_App
//
//  Created by vikash m on 28/07/21.
//

import UIKit

class UpdatePasswordVC: UIViewController {

    //Marks- Outlets
    @IBOutlet weak var oldPasswordTft: UITextField!
    @IBOutlet weak var newpasswordTft: UITextField!
    @IBOutlet weak var confrmPswdTFT: UITextField!
    @IBOutlet weak var updatePassBtn: UIButton!
 
    //Marks - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
      
        oldPasswordTft.designTextFlds()
        newpasswordTft.designTextFlds()
        updatePassBtn.designButton()
        confrmPswdTFT.designTextFlds()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = true
    }
}
//Marks:- Actions
extension UpdatePasswordVC
{
    @IBAction func updatePassBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginVC")as! LoginVC
              self.navigationController?.pushViewController(vc, animated: true)
       
        
    }
}
