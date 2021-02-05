//
//  SectionLabelTVCell.swift
//  Interview Task
//
//  Created by Ashok on 04/02/21.
//  Copyright © 2021 vijay. All rights reserved.
//

import UIKit

class SectionLabelTVCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var availableBtn: UIButton!
    @IBOutlet weak var availableView: UIView!

    @IBOutlet weak var loanedBtn: UIButton!
    @IBOutlet weak var loanedView: UIView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.shadowView.dropShadows(radius: 5, color: UIColor.darkGray)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension UIView {
    func dropShadows(scale: Bool = true,radius:CGFloat,color:UIColor) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = .zero
        layer.shadowRadius = radius
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
}
