//
//  AppCartCell.swift
//  Food_App
//
//  Created by vikash m on 02/08/21.
//

import UIKit
protocol TableViewCellCustomDelegate: class {
    func buttonTapped(index : Int, delta : Int)
}

class AppCartCell: UITableViewCell {
    weak var delegate: TableViewCellCustomDelegate?

    @IBOutlet weak var cartImgVw: UIImageView!
    
    @IBOutlet weak var cartName: UILabel!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var cartTotalLbl: UILabel!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var iteamNoLbl: UILabel!
    
    
    override func prepareForReuse() {
           super.prepareForReuse()
           self.delegate = nil
       }
    @IBAction func minusButtonClick(_ sender: UIButton) {
          delegate?.buttonTapped(index: sender.tag, delta : -1)
      }

      @IBAction func plusButtonClick(_ sender: UIButton) {
          delegate?.buttonTapped(index: sender.tag,delta : +1)
      }
}

