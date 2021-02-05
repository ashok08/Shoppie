//
//  SectionItemTVCell.swift
//  Interview Task
//
//  Created by Ashok on 04/02/21.
//  Copyright © 2021 vijay. All rights reserved.
//

import UIKit

class SectionItemTVCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var itemLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
