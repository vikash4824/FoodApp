//
//  AddNewPasswordVC.swift
//  Food_App
//
//  Created by vikash m on 28/07/21.
//

import UIKit

class AddNewPasswordVC: UIViewController {

   //Marks:- Outlets
    @IBOutlet weak var newPasswordTf: UITextField!
    @IBOutlet weak var ConformPassTf: UITextField!
    @IBOutlet weak var addNewpassBtn: UIButton!
  
    //Marks :- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
      
        newPasswordTf.designTextFlds()
        ConformPassTf.designTextFlds()
        addNewpassBtn.designButton()

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = true
    }
    }
//Marks:- Actions
extension AddNewPasswordVC
{
    
       @IBAction func addNewpassBtn(_ sender: Any) {
           let vc = storyboard?.instantiateViewController(withIdentifier: "UpdatePasswordVC")as! UpdatePasswordVC
                 self.navigationController?.pushViewController(vc, animated: true)
           
       }
}
