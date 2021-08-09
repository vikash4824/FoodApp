//
//  OnBoardingVC.swift
//  Food_App
//
//  Created by vikash m on 27/07/21.
//

import UIKit

class OnBoardingVC: UIViewController {

    //Mark:- Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet  var pageControls: [UIView]!
    @IBOutlet  var pageControlsWidth: [NSLayoutConstraint]!

    //Mark:- Variables
    let imagesArray = ["Image1","Image2","image3","Image4"]
    let titleArray = ["All Favourite Food\nin One Place","Order From Your\nNearest restaurant","Enjoy Our Free \nDelivery","Easily Track Your \nOrder"]
     var collectionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        setPageControl(index: 0)
        nextBtn.setImage(UIImage(named: "Next"), for: .normal)
    }

    //Mark:- Set Page Control
    func setPageControl(index: Int){
      
        for i in 0..<pageControls.count{
            if i == index{
                UIView.animate(withDuration: 0.6) {
                    self.pageControls[i].backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.8156862745, blue: 0.4196078431, alpha: 1)
                    self.pageControlsWidth[i].constant = 20
                }
                
            }else{
                UIView.animate(withDuration: 0.6) {
                    self.pageControls[i].backgroundColor = #colorLiteral(red: 0.831372549, green: 0.8549019608, blue: 0.8862745098, alpha: 1)
                    self.pageControlsWidth[i].constant = 15
                }
               
            }
        }
    }

   //Mark:- Buttons Action
    @IBAction func nextBtnActn(_ sender: UIButton){
        
        if nextBtn.currentImage == UIImage(named: "Next"){
            
            collectionIndex = collectionIndex + 1
            self.collectionView.scrollToItem(at: IndexPath(item: collectionIndex, section: 0), at: .centeredHorizontally, animated: true)
            setPageControl(index: collectionIndex)
            if collectionIndex == 3{
                sender.setImage(UIImage(named: "Done"), for: .normal)
                skipBtn.setTitle("Back", for: .normal)
                let login = storyboard?.instantiateViewController(withIdentifier: "SignInVC")as! SignInVC
                login.modalPresentationStyle = .fullScreen
                  present(login, animated: true)
            }
        }

    }
 
//Mark:- Buttion Action
    @IBAction func skipBtnActn(_ sender: UIButton){
        
        if sender.currentTitle == "Back"{
        collectionIndex = collectionIndex - 1
        self.collectionView.scrollToItem(at: IndexPath(item: collectionIndex, section: 0), at: .centeredHorizontally, animated: true)
            setPageControl(index: collectionIndex)
            nextBtn.setImage(UIImage(named: "Next"), for: .normal)
        skipBtn.setTitle("Skip", for: .normal)

        }
        
    }
}

//Mark:- Extension for collection view delegate and data Source methods
extension OnBoardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingCollectionViewCell", for: indexPath) as! OnBoardingCollectionViewCell
        
        cell.imageView.image = UIImage(named: imagesArray[indexPath.item])
        cell.titleLbl.text = titleArray[indexPath.item]
        
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        return CGSize(width: collectionView.bounds.width - 8 , height: collectionView.bounds.height)
         
        }
      
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
             return 10
        
        }

}
