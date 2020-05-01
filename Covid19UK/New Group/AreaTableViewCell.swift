//
//  AreaTableViewCell.swift
//  Covid19UK
//
//  Created by ChiuWanNuo on 28/04/2020.
//  Copyright © 2020 ChiuWanNuo. All rights reserved.
//

import UIKit

class AreaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var areanameLabel: UILabel!
    @IBOutlet weak var areanumberLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
