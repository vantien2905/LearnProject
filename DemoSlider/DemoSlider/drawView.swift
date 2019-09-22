//
//  drawView.swift
//  DemoSlider
//
//  Created by DINH VAN TIEN on 11/21/18.
//  Copyright © 2018 DINH VAN TIEN. All rights reserved.
//

import UIKit

class DrawView: BaseView {
   
    let slider: Slider = {
        let sl = Slider()
        return sl
    }()
    
    var path: UIBezierPath!
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
    }
    
    override func setUpViews() {
        self.addSubview(slider)
        slider.fillSuperview()
    }
}



class Slider: UISlider {
    var path: UIBezierPath!
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        path = UIBezierPath()
        path.move(to: CGPoint(x: 5, y: self.frame.size.height/2))
        path.addArc(withCenter: CGPoint(x: 5, y: self.frame.size.height/2), radius: 5, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        path.move(to: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2))
        path.addArc(withCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2), radius: 5, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        // Specify the fill color and apply it to the path.
        UIColor.orange.setFill()
        path.fill()
        
        // Specify a border (stroke) color.
        UIColor.purple.setStroke()
        path.stroke()
    }
}
