//
//  AppCartVC.swift
//  Food_App
//
//  Created by vikash m on 02/08/21.
//

import UIKit

class AppCartVC: UIViewController {

    @IBOutlet weak var appCartTableVW: UITableView!
    
    @IBOutlet weak var placeOrderBtn: UIButton!
    
    //Mark:- Variables
    let imagesArray = ["burger2","Neppizza","pizza-1","burger3","burger4","burger5"]
    let titleArray = ["Hot Spicy Burger", "Neapolitan Pizza","Veg Pizza","Chicken Burger","Bisoon Burgers","Salmon Burgers"]
    var itemArray : [AppCartItemModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        view.addSubview(navBar)

        
        itemArray.append(AppCartItemModel(image: "burger2", name: "Hot Spicy Burger", price: "$20.60", count: 0))
        itemArray.append(AppCartItemModel(image: "pizza-1", name: "Neapolitan Pizza", price: "$48", count: 0))
        itemArray.append(AppCartItemModel(image: "Neppizza", name: "Veg Pizza", price: "$30.80", count: 0))
        itemArray.append(AppCartItemModel(image: "burger3", name: "Chicken Burger", price: "$55.35", count: 0))
        itemArray.append(AppCartItemModel(image: "burger4", name: "Bisoon Burger", price: "$25.30", count: 0))
        itemArray.append(AppCartItemModel(image: "burger5", name: "Salmon Burger", price: "$25.30", count: 0))
        
        self.appCartTableVW.register(UINib(nibName: "AppCartCell", bundle: nil), forCellReuseIdentifier: "AppCartCell")
    }
    

    @objc func logoutUser(){
         print("clicked")
    }

}


//Mark:- Extension for table view delegate and data Source methods
extension AppCartVC: UITableViewDelegate,UITableViewDataSource
{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = appCartTableVW.dequeueReusableCell(withIdentifier: "AppCartCell")as! AppCartCell
        let arry = itemArray[indexPath.row]
        cell.iteamNoLbl.text = "\(itemArray[indexPath.row].count)"
        cell.cartImgVw.image = UIImage(named: arry.image)
        cell.cartName.text = arry.name
        cell.cartTotalLbl.text = arry.price
        cell.minusBtn.tag = indexPath.row
        cell.plusBtn.tag = indexPath.row

        cell.delegate = self
        
        return cell
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
            -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
                self.appCartTableVW.beginUpdates()
                self.itemArray.remove(at: indexPath.row)
                self.appCartTableVW.deleteRows(at: [indexPath], with: .automatic)
                self.appCartTableVW.endUpdates()
                completionHandler(true)
        }
            deleteAction.image = UIImage(systemName: "trash")
            deleteAction.backgroundColor = .gray
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
            return configuration
    }
    
   //Marks:- Action Keys
    @IBAction func placeOrderBtn(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard?.instantiateViewController(withIdentifier: "CheckOutVC")as! CheckOutVC
              self.navigationController?.pushViewController(vc, animated: true )
    }
    


   
}
extension AppCartVC: TableViewCellCustomDelegate {
    func buttonTapped(index: Int, delta : Int)
    {
       
       itemArray[index].count += delta
        if itemArray[index].count < 0
       {
            itemArray[index].count = 0
        }

        appCartTableVW.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
}
