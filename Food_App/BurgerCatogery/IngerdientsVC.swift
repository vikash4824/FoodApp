//
//  IngerdientsVC.swift
//  Food_App
//
//  Created by vikash m on 02/08/21.
//

import UIKit

class IngerdientsVC: UIViewController {
    //Marks:- Outlets
    @IBOutlet weak var IngridentsTableVw: UITableView!
    
    //Marks:-Variables
    let imageArry = ["joint","cabbage","Carrot","Chilli","Onion","Tomato"]
    let nameAry = ["Chicken :","Cabbage :","Carrot :","Chilli :","Onion :","Tomato :"]
    let quantityArry = ["02 Pcs","500 Gm","200 Gm","50 Gm","200 Gm","300 Gm"]
    var ingridentsArry = [IngridentsItemModel]()
    
    //Marks:- ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ingridentsArry.append(IngridentsItemModel(image: "joint", name: "Chicken :", quantity: "02 Pcs"))
        ingridentsArry.append(IngridentsItemModel(image: "cabbage", name: "Cabbage :", quantity: "500 Gm"))
        ingridentsArry.append(IngridentsItemModel(image: "Carrot", name: "Carrot :", quantity: "200 Gm"))
        ingridentsArry.append(IngridentsItemModel(image: "Chilli", name: "Chilli :", quantity: "50 Gm"))
        ingridentsArry.append(IngridentsItemModel(image: "Onion", name: "Onion :", quantity: "200 Gm"))
        ingridentsArry.append(IngridentsItemModel(image: "Tomato", name: "Tomato :", quantity: "300 Gm"))


        self.IngridentsTableVw.register(UINib(nibName: "ingridentsCell", bundle: nil), forCellReuseIdentifier: "IngridentsCell")

        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       
    }
}
//Mark:- Extension for table view delegate and data Source methods
extension IngerdientsVC: UITableViewDelegate,UITableViewDataSource
{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameAry.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = IngridentsTableVw.dequeueReusableCell(withIdentifier: "IngridentsCell")as! IngridentsCell
        let arry = ingridentsArry[indexPath.row]
        cell.ingridentsCellImgVw.image = UIImage(named: arry.image)
        cell.IngridentsLbl1.text = arry.name
        cell.IngridentsLbl2.text = arry.quantity
        
        return cell
    }
    
    
}
