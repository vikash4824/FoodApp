//
//  LoginVC.swift
//  Food_App
//
//  Created by vikash m on 27/07/21.
//

import UIKit

class LoginVC: UIViewController {

   
   
    
    
   
 
    @IBOutlet weak var emailTft: UITextField!
    @IBOutlet weak var passwrdTft: UITextField!
    @IBOutlet weak var forgetpassBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
   
    @IBOutlet weak var remembrBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.designButton()
        emailTft.designTextFlds()
        passwrdTft.designTextFlds()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = true
    }
}
extension LoginVC
{
    
    @IBAction func loginBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ResetPasswordVC")as! ResetPasswordVC
              self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
