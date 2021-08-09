//
//  ProfileVC.swift
//  Food_App
//
//  Created by vikash m on 09/08/21.
//

import UIKit

class ProfileVC: UIViewController {
  //Marks:- Outlets
    @IBOutlet weak var profileTblVw: UITableView!
    
    //Marks:- Variables
    var imageArry = ["profile1","bellprf","gearprf","currencyprf","exit"]
    var nameArry = ["My Profile","Notifications","Settings","Payments","Log Out"]
    var imgColour = ["#EFF2FF","#E2FFE1","#FFF3D0","#EDF0FF","#FFE5E5",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileTblVw.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        
    }
}
extension ProfileVC:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTblVw.dequeueReusableCell(withIdentifier: "ProfileCell")as! ProfileCell
        cell.profileCellLbl.text! = nameArry[indexPath.row]
        cell.profileImgVw.image = UIImage(named: imageArry[indexPath.row])
        cell.profileImgVw.backgroundColor = UIColor(named: imgColour[indexPath.row % imgColour.count])
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
   
    
}
