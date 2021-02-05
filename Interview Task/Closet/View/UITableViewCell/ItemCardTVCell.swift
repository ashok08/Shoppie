//
//  ItemCardTVCell.swift
//  Interview Task
//
//  Created by Ashok on 04/02/21.
//  Copyright © 2021 vijay. All rights reserved.
//

import UIKit
protocol SwipeDelegate {
    func swipeDelegateMethod(type:Int,index:Int)
}
class ItemCardTVCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var sizeLbl: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var datelbl: UILabel!
    
    var delegate:SwipeDelegate!
    var index = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        self.shadowView.layer.cornerRadius = 10
        self.shadowView.dropShadows(radius: 6, color: UIColor.lightGray)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        self.shadowView.addGestureRecognizer(swipeRight)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUI(values:ClosetModel,index:Int){
        self.index = index
        self.titleLbl.text = values.name
        self.userName.text = values.user_name
        self.datelbl.text = values.date
        self.itemImage.image = UIImage(named: values.image)
        self.userImage.image = UIImage(named: values.user_image)
        self.rateLbl.text = values.rate
        self.sizeLbl.text = values.size
        self.ratingLbl.text = values.rating
    }
 
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
            case .right:
                self.delegate.swipeDelegateMethod(type: 1, index: index)
            default:
                break
            }
        }
    }
}
