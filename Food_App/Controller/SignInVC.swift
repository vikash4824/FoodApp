//
//  SignInVC.swift
//  Food_App
//
//  Created by vikash m on 27/07/21.
//

import UIKit

class SignInVC: UIViewController {

   
    
   
    //Marks - Outlets
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var NameTf: UITextField!
   //Marks- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.designButton()
        NameTf.designTextFlds()
        emailTf.designTextFlds()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
}


// MARK: - Action Method
extension SignInVC
{
    @IBAction func nextBtn(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignInNextstepVC")as! SignInNextstepVC
              self.navigationController?.pushViewController(vc, animated: true)
        
    }
 

}
