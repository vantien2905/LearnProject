//
//  NCSDrawPercentView.swift
//  NCS
//
//  Created by Kai on 10/17/17.
//  Copyright © 2017 sg.vinova.nsc. All rights reserved.
//

import UIKit

class DrawSliderView: BaseView {
    var colorCompleted: UIColor     = UIColor.red
    var currentValue: Float   = 60 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var minimumValue: Float = 60
    var maximumValue: Float = 100
    var segment: CGFloat = 20
    var radiusThumb: CGFloat = 6
    var heightTrack: CGFloat = 5
    var radiusPoint: CGFloat = 5
    var color = UIColor.red
    
    override func draw(_ rect: CGRect) {
        let newRect         = CGRect(x: rect.minX + radiusThumb, y: rect.midY - heightTrack/2, width: rect.width - 2*radiusThumb, height: heightTrack )
        let pathBackground  = UIBezierPath(rect: newRect)
        UIColor.gray.setFill()
        pathBackground.fill()

        let widthSlider  = (currentValue - minimumValue) * Float(newRect.width) / (maximumValue - minimumValue)
        let frameCompleted  = CGRect(x: newRect.minX, y: newRect.minY, width: CGFloat(widthSlider), height: newRect.height)
        let pathComplted    = UIBezierPath(rect: frameCompleted)
        color.setFill()
        pathComplted.fill()
        
        //---------
        let width = rect.width
        let countSegment = CGFloat((maximumValue - minimumValue))/segment
        let space = (width - 2*radiusThumb)/countSegment
        let centerY =  rect.midY
        
        var listPoint: [CGPoint] = []
        for index in (0...Int(countSegment)) {
            let point = CGPoint(x: CGFloat(index)*space + radiusThumb, y: centerY)
            listPoint.append(point)
        }
        
        for point in listPoint {
            let path = UIBezierPath()
            path.addArc(withCenter: point, radius: radiusPoint, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
            if (point.x - newRect.minX) <= CGFloat(widthSlider) {
                color.setFill()
                path.fill()
            } else {
                color.setFill()
                path.fill()
            }
        }
    }
}
