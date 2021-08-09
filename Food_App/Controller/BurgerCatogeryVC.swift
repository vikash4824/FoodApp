//
//  BurgerCatogeryVC.swift
//  Food_App
//
//  Created by vikash m on 30/07/21.
//

import UIKit

class BurgerCatogeryVC: UIViewController {

    @IBOutlet weak var BurgerCatgCollectionVw: UICollectionView!
    
    let imagesArray = ["burgerItem","vegBurger","burger1","burger2","burger3","burger4","burger5","burger6"]
    let titleArray = ["Hot Spicy Burger","Veggie Burgers","Chicken Burger","Black Bean Burgers","Elk Burgers","Mushroom Burgers","Salmon Burgers","Bison Burgers"]
    var itemArray = [BurgerItemModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        itemArray.append(BurgerItemModel(image: "burgerItem", name: "Hot Spicy Burger", price: "$12", ratingStar: "4.0", isHeartFav: false))
        itemArray.append(BurgerItemModel(image: "vegBurger", name: "Veggie Burgers", price: "$13", ratingStar: "4.3", isHeartFav: false))
        itemArray.append(BurgerItemModel(image: "burger1", name: "Chicken Burger", price: "$14", ratingStar: "4.2", isHeartFav: false))
        itemArray.append(BurgerItemModel(image: "burger2", name: "Black Bean Burgers", price: "$15", ratingStar: "4.2", isHeartFav: false))
        itemArray.append(BurgerItemModel(image: "burger3", name: "Elk Burgers", price: "$14", ratingStar: "4.3", isHeartFav: false))
        itemArray.append(BurgerItemModel(image: "burger4", name: "Mushroom Burgers", price: "$16", ratingStar: "4.5", isHeartFav: false))
        itemArray.append(BurgerItemModel(image: "burger5", name: "Salmon Burgers", price: "$16", ratingStar: "4.6", isHeartFav: false))
        itemArray.append(BurgerItemModel(image: "burger6", name: "Bison Burgers", price: "$14", ratingStar: "4.8", isHeartFav: false))
        itemArray.append(BurgerItemModel(image: "burger2", name: "Black Bean Burgers", price: "$15", ratingStar: "4.2", isHeartFav: false))
        itemArray.append(BurgerItemModel(image: "vegBurger", name: "Veggie Burgers", price: "$13", ratingStar: "4.3", isHeartFav: false))
       
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            //collection.reloadData()
        }
}
extension BurgerCatogeryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BurgerCollectionViewCell", for: indexPath) as! BurgerCollectionViewCell
        
        let arr = itemArray[indexPath.item]
        cell.cellImgVw.image = UIImage(named: arr.image)
        cell.burgerNameLbl.text = arr.name
        cell.priceLbl.text = arr.price
        cell.ratingLbl.text = arr.ratingStar
        cell.heartBtn.tag = indexPath.item
        cell.heartBtn.addTarget(self, action: #selector(favHeartActn(_:)), for: .touchUpInside)
        if arr.isHeartFav{
            cell.heartBtn.setImage(#imageLiteral(resourceName: "favorite-heart-button"), for: .normal)
        }else{
            cell.heartBtn.setImage(#imageLiteral(resourceName: "fav"), for: .normal)
        }
        
        return cell
    }
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        return CGSize(width:(BurgerCatgCollectionVw.bounds.width-20)/2, height: 216)
         
        }
      
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
             return 10
        
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let vc = storyboard?.instantiateViewController(withIdentifier: "BurgerOrderAppDetailsVC")as! BurgerOrderAppDetailsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //Mark:- Fav Button Action
    
    @objc func favHeartActn(_ sender: UIButton){
        let tag = sender.tag
        if self.itemArray[tag].isHeartFav{
            self.itemArray[tag].isHeartFav = false
        }else{
            self.itemArray[tag].isHeartFav = true
        }
        self.BurgerCatgCollectionVw.reloadData()
    }

}
