//
//  DetailsVC.swift
//  Food_App
//
//  Created by vikash m on 02/08/21.
//

import UIKit

class DetailsVC: UIViewController {
    //Marks:- Outlets
    @IBOutlet weak var detailsCollectionVw: UICollectionView!
    
    //Mark:- Variables
    let imagesArray = ["burgerItem","pizzaItem","Noodels","Sandwich"]
    let titleArray = ["Hot Spicy Burger", "Neapolitan Pizza","Spicy Noodels","Chicken Sandwich"]
    var itemArray = [ItemModel]()
    var lblMsg = ["Pizza is a savory dish of Italian origin, consisting usualy round, flattened base of leavened wheat-based dough topped with tomatoes, cheese and often various other ingredients baked at a high temperature, traditionally in a wood-fired oven. A small pizza is sometimes called a pizzetta"]
    
    //Marks:- View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        itemArray.append(ItemModel(image: "burgerItem", name: "Hot Spicy Burger", price: "$14", ratingStar: "4.5", isFav: false))
        itemArray.append(ItemModel(image: "pizza-1", name: "Neapolitan Pizza", price: "$20", ratingStar: "4.3", isFav: false))
        itemArray.append(ItemModel(image: "Noodels", name: "Chicken Noodels", price: "$12", ratingStar: "4.0", isFav: false))
        itemArray.append(ItemModel(image: "Sandwich-1", name: "Green Sandwich", price: "$10", ratingStar: "4.5", isFav: false))

       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       
    }

}
//Mark:- Extension for collection view delegate and data Source methods
extension DetailsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = detailsCollectionVw.dequeueReusableCell(withReuseIdentifier: "DetailsCollectionViewCell", for: indexPath) as! DetailsCollectionViewCell
        
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
     
        return CGSize(width:(detailsCollectionVw.bounds.width-30)/2, height: 200)
         
        }
      
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
             return 10
        
        }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = detailsCollectionVw.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "DetailCollectionHeader", for: indexPath)as! DetailCollectionHeader
        header.detailsHdrLbl.text = lblMsg[indexPath.item]
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
        self.detailsCollectionVw.reloadData()
    }

}
