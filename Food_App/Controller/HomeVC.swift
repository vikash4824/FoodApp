//
//  HomeVC.swift
//  Food_App
//
//  Created by vikash m on 28/07/21.
//

import UIKit

class HomeVC: UIViewController {

    //Mark:- Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Mark:- Variables
    let imagesArray = ["burgerItem","pizzaItem","Noodels","Sandwich"]
    let titleArray = ["Hot Spicy Burger", "Neapolitan Pizza","Spicy Noodels","Chicken Sandwich"]
    var itemArray = [ItemModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        itemArray.append(ItemModel(image: "burgerItem", name: "Hot Spicy Burger", price: "$14", ratingStar: "4.5", isFav: false))
        itemArray.append(ItemModel(image: "pizza-1", name: "Neapolitan Pizza", price: "$20", ratingStar: "4.3", isFav: false))
        itemArray.append(ItemModel(image: "Noodels", name: "Chicken Noodels", price: "$12", ratingStar: "4.0", isFav: false))
        itemArray.append(ItemModel(image: "Sandwich-1", name: "Green Sandwich", price: "$10", ratingStar: "4.5", isFav: false))

        
    }

}

//Mark:- Extension for collection view delegate and data Source methods
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        let arr = itemArray[indexPath.item]
        cell.imageView.image = UIImage(named: arr.image)
        cell.titleLbl.text = arr.name
        cell.priceLbl.text = arr.price
        cell.ratingLbl.text = arr.ratingStar
        cell.favBtn.tag = indexPath.item
        cell.favBtn.addTarget(self, action: #selector(favBtnActn(_:)), for: .touchUpInside)
        if arr.isFav{
            cell.favBtn.setImage(#imageLiteral(resourceName: "favorite-heart-button"), for: .normal)
        }else{
            cell.favBtn.setImage(#imageLiteral(resourceName: "fav"), for: .normal)
        }
        
        return cell
    }
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        return CGSize(width:(collectionView.bounds.width-30)/2, height: 200)
         
        }
      
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
             return 10
        
        }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeCollectionHeader", for: indexPath)as! HomeCollectionHeader
        
        
        return header
    }
    
    
    //Mark:- Fav Button Action
    
    @objc func favBtnActn(_ sender: UIButton){
        let tag = sender.tag
        if self.itemArray[tag].isFav{
            self.itemArray[tag].isFav = false
        }else{
            self.itemArray[tag].isFav = true
        }
        self.collectionView.reloadData()
    }

}
