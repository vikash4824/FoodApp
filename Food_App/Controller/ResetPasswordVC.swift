//
//  ResetPasswordVC.swift
//  Food_App
//
//  Created by vikash m on 28/07/21.
//

import UIKit

class ResetPasswordVC: UIViewController {

   
    //Marks:- Outlets
    @IBOutlet weak var numberTf: UITextField!
    @IBOutlet weak var sendLinkBtn: UIButton!
    @IBOutlet weak var resetPasswdMnVw: UIView!
    
    //Marks:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        numberTf.designTextFlds()
        sendLinkBtn.designButton()
   
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = true
    }
}
extension ResetPasswordVC
{
    @IBAction func sendLinkBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddNewPasswordVC")as! AddNewPasswordVC
              self.navigationController?.pushViewController(vc, animated: true)
    }
}
