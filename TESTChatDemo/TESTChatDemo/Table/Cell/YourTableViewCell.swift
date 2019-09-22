//
//  YourTableViewCell.swift
//  ChatDemo
//
//  Created by DINH VAN TIEN on 9/4/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

class YourTableViewCell: UITableViewCell {

    @IBOutlet weak var lbMessage: AppLabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = .none
    }
    
}
