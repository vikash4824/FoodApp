//
//  ReviewVC.swift
//  Food_App
//
//  Created by vikash m on 02/08/21.
//

import UIKit

class ReviewVC: UIViewController {
    //Marks:- Outlets
    @IBOutlet weak var reviewTableVw: UITableView!
    
    //Marks:- Variables
    let names = ["Rafa Islam","Jon Kalbert"]
    let profileImg = ["Bitmap","profileimg2"]
    let dates = ["01-02-19","11-04-19"]
    let review = ["Pizza is a savory dish of Italian origin consistin usualy round, flattened base of leavene cheas topped with tomatoes.","Pizza is a savory dish of Italian origin consistin usualy round, flattened base of leavene cheas topped with tomatoes."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.reviewTableVw.register(UINib(nibName: "ReviewCell", bundle: nil), forCellReuseIdentifier: "ReviewCell")

       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       
    }

   
}
//Mark:- Extension for table view delegate and data Source methods
extension ReviewVC: UITableViewDelegate,UITableViewDataSource
{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = reviewTableVw.dequeueReusableCell(withIdentifier: "ReviewCell")as! ReviewCell
        
        cell.reviewProfileImgVW.image = UIImage(named: profileImg[indexPath.row])
        cell.reviewDateLbl.text = dates[indexPath.row]
        cell.reviewNameLbl.text = names[indexPath.row]
        cell.ReviewDescLbl.text = review[indexPath.row]
        
        
        
        
        return cell
    }
    
    
}
