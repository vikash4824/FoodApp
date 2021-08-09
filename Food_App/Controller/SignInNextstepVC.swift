//
//  SignInNextstepVC.swift
//  Food_App
//
//  Created by vikash m on 27/07/21.
//

import UIKit

class SignInNextstepVC: UIViewController {

   
  
    //Marks - Outlets

    @IBOutlet weak var numberTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var nxtBtn: UIButton!
    
    //Marks- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTf.designTextFlds()
        nxtBtn.designButton()
        numberTf.designTextFlds()
       

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = true
    }
}

// MARK: - Action Method
extension SignInNextstepVC
{
    @IBAction func nxtBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "NumberVarificationCodeVC")as! NumberVarificationCodeVC
              self.navigationController?.pushViewController(vc, animated: true)
    }
}
