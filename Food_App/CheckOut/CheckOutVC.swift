//
//  CheckOutVC.swift
//  Food_App
//
//  Created by vikash m on 03/08/21.
//

import UIKit

class CheckOutVC: UIViewController {

    //Marks:- Outlets
    @IBOutlet weak var checkOutTableVw: UITableView!
    @IBOutlet weak var OrderNwBtn: UIButton!
   //Marks:- Variables
    var TitleNames = ["Delivery Address","Payment Method"]
    
    var addressZone = ["Home"]
    var address = ["216/ East Custom, Chhatak"]
    
    var paymentMethods = ["Visa Card","Cash On Delivery","Paypal","Apple Pay"]
    var paymentImg = ["visa","money","paypal","apple"]
    var paymentDetails = ["**** **** **** 5162","Pay after recive delivery","shakib402@paypal","shakib402@apple.pay"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        self.checkOutTableVw.register(UINib(nibName: "AddressCell", bundle: nil), forCellReuseIdentifier: "AddressCell")
        
        self.checkOutTableVw.register(UINib(nibName: "PaymentMethodCell", bundle: nil), forCellReuseIdentifier: "PaymentMethodCell")
    }
    
    @IBAction func OrderNwBtn(_ sender: Any) {
    }
    
   
}
//Mark:- Extension for table view delegate and data Source methods
extension CheckOutVC: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(TitleNames[section])"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }
    func numberOfSections(in tableView: UITableView) -> Int {
        return TitleNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
                   return addressZone.count
               }
               else {
                   return paymentMethods.count
               }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if (indexPath.section == 0){
                 var cell:AddressCell = checkOutTableVw.dequeueReusableCell(withIdentifier: "AddressCell", for: indexPath)as! AddressCell
            cell.homeLbl.text = addressZone[indexPath.row]
            cell.addressLbl.text = address[indexPath.row]
            cell.selectionStyle = .none
          
            cell.checkMarkBtn.addTarget(self, action: #selector(checkMarkClick(sender:)), for: .touchUpInside)
            cell.checkMarkBtn.tag = indexPath.row
                 return cell
             }
        
            else{
               var cell:PaymentMethodCell = checkOutTableVw.dequeueReusableCell(withIdentifier: "PaymentMethodCell", for: indexPath)as! PaymentMethodCell
                cell.paymentImgVw.image = UIImage(named: paymentImg[indexPath.row])
                cell.paymentLbl.text = paymentMethods[indexPath.row]
                cell.paymentDetailsLbl.text = paymentDetails[indexPath.row]
                cell.checkMarkBtn.addTarget(self, action: #selector(checkMarkClick(sender:)), for: .touchUpInside)
                cell.checkMarkBtn.tag = indexPath.row
               cell.backgroundColor = UIColor.white

               return cell
             }
            
        
               
             
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    
   //Marks:- Action Keys
   
   @objc func checkMarkClick( sender: UIButton!)
    {
    if sender.isSelected
    {
        sender.isSelected = false
    }else
    {
        sender.isSelected = true
    }
    checkOutTableVw.reloadData()
    }
}
