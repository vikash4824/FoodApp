//
//  CategoryVC.swift
//  Food_App
//
//  Created by vikash m on 30/07/21.
//

import UIKit

class CategoryVC: UIViewController {

    var screenSize: CGRect!
        var screenWidth: CGFloat!
        var screenHeight: CGFloat!
    
    //Marks:- Layouts
    
    @IBOutlet weak var sideMenuVw: UIView!
    @IBOutlet weak var sideMenuCnst: NSLayoutConstraint!
    @IBOutlet weak var catogryCollectionVw: UICollectionView!
    @IBOutlet weak var burgerBtn: UIButton!
    let imagesArray = ["burgerItem","Sandwich-1","Noodels","pizza-1","hotdog","donut","nuggets","chips"]
    let nameArray = ["Burger", "Sandwich","Noodels","Pizza","HotDog","Donut","Nuggets","Chips"]
    var menuArray = [CatogryModel]()
    var isSlideMenuHidden = true
    //Marks:liafe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        burgerBtn.setBackgroundColor(color: UIColor.white, forState: UIControl.State.highlighted)
        
      //Marks:- Initialize constant
        sideMenuVw.layer.cornerRadius = 15
        sideMenuVw.clipsToBounds = true
        sideMenuCnst.constant = -90
        menuArray.append(CatogryModel(catimage: "burgerItem", name: "Burger"))
        menuArray.append(CatogryModel(catimage: "Sandwich-1", name: "Sandwich"))
        menuArray.append(CatogryModel(catimage: "Noodels", name: "Noodels"))
        menuArray.append(CatogryModel(catimage: "pizza-1", name: "Pizza"))
        menuArray.append(CatogryModel(catimage: "hotdog", name: "HotDog"))
        menuArray.append(CatogryModel(catimage: "donut", name: "Donut"))
        menuArray.append(CatogryModel(catimage: "nuggets", name: "Nuggets"))
        menuArray.append(CatogryModel(catimage: "chips", name: "Chips"))
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
          
        }
}
// Marks:-Action Key
extension CategoryVC
{
    
    @IBAction func organizeMenuBtn(_ sender: UIBarButtonItem) {
        if isSlideMenuHidden
        {
            sideMenuCnst.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }else
        {
            sideMenuCnst.constant = -90
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        isSlideMenuHidden = !isSlideMenuHidden
    }
}
extension CategoryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatogeryCvCell", for: indexPath) as! CatogeryCvCell
        
        let arr = menuArray[indexPath.item]
        cell.cellImgVw.image = UIImage(named: arr.catgimage)
        cell.cellNameLbl.text = arr.name
        
        
        return cell
    }
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(catogryCollectionVw.bounds.width-30)/2, height: 200)

    }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
             return 10


        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let vc = storyboard?.instantiateViewController(withIdentifier: "BurgerCatogeryVC")as! BurgerCatogeryVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
    
   
}
