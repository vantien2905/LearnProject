//
//  BaseViewXib.swift
//  led-controller-ios
//
//  Created by Tien Dinh on 10/2/18.
//  Copyright © 2018 Mai Nhan. All rights reserved.
//

import UIKit

class BaseViewXib: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }
    
    func loadViewFromNib() {
        let nibName     = String(describing: type(of: self))
        let nib         = UINib(nibName: nibName, bundle: nil)
        let view        = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame      = bounds
        addSubview(view)
        setUpView()
    }
    
    func setUpView() {
        
    }
}
