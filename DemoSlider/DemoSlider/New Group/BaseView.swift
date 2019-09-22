//
//  BaseView.swift
//  led-controller-ios
//
//  Created by Tien Dinh on 10/2/18.
//  Copyright © 2018 Mai Nhan. All rights reserved.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpViews()
    }
    
    func setUpViews() {
        
    }
}

