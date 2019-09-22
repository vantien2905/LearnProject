//
//  HeaderCell.swift
//  demoTableView
//
//  Created by DINH VAN TIEN on 11/7/18.
//  Copyright © 2018 DINH VAN TIEN. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var lbName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
