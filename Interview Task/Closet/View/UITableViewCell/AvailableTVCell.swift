//
//  AvailableTVCell.swift
//  Interview Task
//
//  Created by Ashok on 04/02/21.
//  Copyright © 2021 vijay. All rights reserved.
//

import UIKit

class AvailableTVCell: UITableViewCell {
    
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var sizeLbl: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var viewLbl: UILabel!
    @IBOutlet weak var shadowView: UIView!
    
    var delegate:SwipeDelegate!
   var index = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        self.shadowView.layer.cornerRadius = 10
        self.shadowView.dropShadows(radius: 6, color: UIColor.lightGray)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .left
        self.shadowView.addGestureRecognizer(swipeRight)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }
    func setUI(values:ClosetModel,index:Int){
        self.index = index
        self.titleLbl.text = values.name
        self.itemImage.image = UIImage(named: values.image)
        self.rateLbl.text = values.rate
        self.sizeLbl.text = values.size
        self.viewLbl.text = values.view
        self.ratingLbl.text = values.rating
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case .left:
                self.delegate.swipeDelegateMethod(type: 0, index:  self.index)
            default:
                break
            }
        }
    }
}
