//
//  BurgerOrderAppDetailsVC.swift
//  Food_App
//
//  Created by vikash m on 31/07/21.
//

import UIKit

class BurgerOrderAppDetailsVC: UIViewController {
    private enum Constants {
           static let segmentedControlHeight: CGFloat = 40
           static let underlineViewColor: UIColor = .blue
           static let underlineViewHeight: CGFloat = 2
       }

    
    enum TabIndex : Int {
        case firstChildTab = 0
        case secondChildTab = 1
        case thirdChildTab = 2
    }
    
    //Marks:- OutLets
    @IBOutlet weak var cartTotalVw: UIView!
    @IBOutlet weak var totalBtn: UIButton!
    @IBOutlet weak var cartLbl: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var switchViewAction: UISegmentedControl!
    
    //Marks:-Variables
    var currentViewController: UIViewController?
    lazy var firstChildTabVC: UIViewController? = {
        let firstChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVC")
        var count = 0
        return firstChildTabVC
    }()
    lazy var secondChildTabVC : UIViewController? = {
        let secondChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "IngerdientsVC")
        
        return secondChildTabVC
    }()
    lazy var thirdChildTabVC : UIViewController? = {
        let thirdChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "ReviewVC")
        
        return thirdChildTabVC
    }()
    
    //Marks:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTotalVw.designView()
        totalBtn.designButton()
        fixBackgroundSegmentControl(switchViewAction)
    self.switchViewAction.selectedSegmentTintColor = UIColor.clear;

        
        switchViewAction.selectedSegmentIndex = TabIndex.firstChildTab.rawValue
        displayCurrentTab(TabIndex.firstChildTab.rawValue)
        
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentViewController = currentViewController {
            currentViewController.viewWillDisappear(animated)
        }
    }
   
}

//Marks:ActionKeys
extension BurgerOrderAppDetailsVC
{
    func displayCurrentTab(_ tabIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(tabIndex) {
            
            self.addChild(vc)
            vc.didMove(toParent: self)
            
            vc.view.frame = self.viewContainer.bounds
            self.viewContainer.addSubview(vc.view)
            self.currentViewController = vc
        }
    }
    
    func viewControllerForSelectedSegmentIndex(_ index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case TabIndex.firstChildTab.rawValue :
            vc = firstChildTabVC
        case TabIndex.secondChildTab.rawValue :
            vc = secondChildTabVC
        case TabIndex.thirdChildTab.rawValue :
            vc = thirdChildTabVC
        default:
        return nil
        }
    
        return vc
    }
    //Marks:ActionKeys
    @IBAction func substrctCrtBtn(_ sender: Any) {
      
        guard let presentValue = Int(cartLbl.text!) else { return }
        if presentValue > 0 {
           let newValue = presentValue - 1
             cartLbl.text! = String(newValue)
        }else
        {
      cartLbl.text! = String(0)
        }
    }
    @IBAction func addCartBtn(_ sender: Any) {
        
        guard let presentValue = Int(cartLbl.text!) else { return }

         let newValue = presentValue + 1
        cartLbl.text! = String(newValue)
    }
    
    @IBAction func switchViewAction(_ sender: UISegmentedControl) {

        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParent()
        
        displayCurrentTab(sender.selectedSegmentIndex)
    }
    @IBAction func totalBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AppCartVC")as! AppCartVC
              self.navigationController?.pushViewController(vc, animated: true )
    }
    
}
//Marks:- Segmented Controller BackGround Colour
extension BurgerOrderAppDetailsVC
{
    func fixBackgroundSegmentControl( _ segmentControl: UISegmentedControl){
        if #available(iOS 13.0, *) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                for i in 0...(segmentControl.numberOfSegments-1)  {
                    let backgroundSegmentView = segmentControl.subviews[i]
                    backgroundSegmentView.isHidden = true
                }
            }
        }
    }
}
