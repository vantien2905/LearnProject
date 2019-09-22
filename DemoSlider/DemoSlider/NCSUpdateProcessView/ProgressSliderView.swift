//
//  NCSUpdateProcessView.swift
//  NCS
//
//  Created by Kai on 11/2/17.
//  Copyright © 2017 sg.vinova.nsc. All rights reserved.
//

import UIKit

class ProgressSliderView: BaseViewXib {
    @IBOutlet weak var lbCurrentPercent     : UILabel!
    @IBOutlet weak var sliPercent           : UISlider!
    @IBOutlet weak var vPercent             : DrawSliderView!
    @IBOutlet weak var leadingLbCurrent     : NSLayoutConstraint!
    @IBOutlet weak var heightVPercent       : NSLayoutConstraint!

    override func loadViewFromNib() {
        super.loadViewFromNib()
        lbCurrentPercent.setBorder(cornerRadius: 0)
        //---
        vPercent.colorCompleted = UIColor.blue
        lbCurrentPercent.textColor = UIColor.blue
        setUpSize()
        self.lbCurrentPercent.text  = "\(Int(vPercent.minimumValue))"
        sliPercent.setThumbImage(UIImage(named: "circle"), for: .normal)
    }
    
    func setUpSize() {
        lbCurrentPercent.font       = UIFont.systemFont(ofSize: 17)
        heightVPercent.constant     = CGFloat(21)
        vPercent.minimumValue = sliPercent.minimumValue
        vPercent.maximumValue = sliPercent.maximumValue
        vPercent.color = .green
        vPercent.currentValue = 10
        
    }

    @IBAction func handleChange(_ sender: UISlider) {
        let percent = sender.value
        let roundedValue = round(sliPercent.value / Float(20)) * Float(20)
        sliPercent.value = roundedValue
        self.vPercent.currentValue    =  roundedValue
        lbCurrentPercent.text = "\(Int(roundedValue))"
        //---
        UIView.animate(withDuration: 0.1, animations: {
            if percent == sender.maximumValue {
                self.leadingLbCurrent.constant          = self.sliPercent.thumbFrame.minX - 30
                self.lbCurrentPercent.textAlignment     = .right
            } else {
                self.leadingLbCurrent.constant          = self.sliPercent.thumbFrame.minX + 3
                self.lbCurrentPercent.textAlignment     = .left
            }
            
        })
    }
}

extension UISlider {
    
    var trackBounds: CGRect {
        return trackRect(forBounds: bounds)
    }
    
    var trackFrame: CGRect {
        guard let superView = superview else { return CGRect.zero }
        return self.convert(trackBounds, to: superView)
    }
    
    var thumbBounds: CGRect {
        return thumbRect(forBounds: frame, trackRect: trackBounds, value: value)
    }
    
    var thumbFrame: CGRect {
        return thumbRect(forBounds: bounds, trackRect: trackFrame, value: value)
    }
}

