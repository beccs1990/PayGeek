//
//  IncomeViewCell.swift
//  CIS55_Project_2
//
//  Created by profile on 3/9/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class IncomeViewCell: UITableViewCell {

    
    @IBOutlet weak var inName: UILabel!
    @IBOutlet weak var inNum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
