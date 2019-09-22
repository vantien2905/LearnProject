//
//  FooterCell.swift
//  demoTableView
//
//  Created by DINH VAN TIEN on 11/7/18.
//  Copyright © 2018 DINH VAN TIEN. All rights reserved.
//

import UIKit

protocol FooterCellDelegate: class {
    func moreTapped(section: Int)
}

class FooterCell: UITableViewCell {
    
    @IBOutlet weak var btnMore: UIButton!

    weak var delegate: FooterCellDelegate?
    var section = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnMoreTapped() {
        delegate?.moreTapped(section: section)
    }
}
