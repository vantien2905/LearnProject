//
//  CustomHeaderFooterView.swift
//  DTTableViewManager
//
//  Created by Denys Telezhkin on 03.08.15.
//  Copyright (c) 2015 Denys Telezhkin. All rights reserved.
//

import UIKit
import DTModelStorage

class CustomHeaderFooterView: UITableViewHeaderFooterView, ModelTransfer {

    @IBOutlet weak var backgroundPatternView: UIView!
    @IBOutlet weak var label: UILabel!
    
    func update(with model: (String, UIImage) ) {
        label.text = model.0
        label.textColor = .white
        backgroundPatternView.backgroundColor = UIColor(patternImage: model.1)
    }

}
