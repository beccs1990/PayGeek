//
//  ExpenseViewCell.swift
//  CIS55_Project_2
//
//  Created by profile on 3/9/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class ExpenseViewCell: UITableViewCell {

    @IBOutlet var expName: UILabel!
    @IBOutlet var expNum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
