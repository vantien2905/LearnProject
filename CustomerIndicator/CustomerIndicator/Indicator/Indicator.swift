//
//  Indicator.swift
//  CustomerIndicator
//
//  Created by DINH VAN TIEN on 12/19/18.
//  Copyright © 2018 DINH VAN TIEN. All rights reserved.
//

import UIKit

class Indicator: UIView {
    
    @IBOutlet weak var vIndicator: UIView!
    @IBOutlet weak var vImage: UIView!
    
    let circleLayer = CAShapeLayer()
    
    let strokeEndAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        let group = CAAnimationGroup()
        group.duration = 2.5
        group.repeatCount = MAXFLOAT
        group.animations = [animation]
        
        return group
    }()
    
    let strokeStartAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeStart")
        animation.beginTime = 0.5
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        let group = CAAnimationGroup()
        group.duration = 2.5
        group.repeatCount = MAXFLOAT
        group.animations = [animation]
        
        return group
    }()

    
    var animating: Bool = true {
        didSet {
            updateAnimation()
        }
    }
    
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
//        self.fillVerticalSuperview()
//        self.fillHorizontalSuperview()
        setUpView()
    }
    
    func setUpView() {
        circleLayer.lineWidth = 10
        circleLayer.fillColor = nil
        circleLayer.strokeColor = UIColor.orange.cgColor
        layer.addSublayer(circleLayer)
        vIndicator.backgroundColor = .blue
        vIndicator.layer.cornerRadius = 50
        vImage.layer.cornerRadius = 35
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let center = CGPoint(x: vIndicator.frame.midX, y: vIndicator.frame.midY)
        let radius = CGFloat(45)//min(vIndicator.bounds.width, vIndicator.bounds.height) / 2 - circleLayer.lineWidth/2
        
        let startAngle = CGFloat(-Double.pi/2)
        let endAngle = startAngle + CGFloat(Double.pi * 2)
        let path = UIBezierPath(arcCenter: CGPoint(x: vIndicator.frame.midX, y: vIndicator.frame.minY), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        circleLayer.position = center
        circleLayer.path = path.cgPath
//        updateAnimation()
    }
    
    func stopLoading() {
        circleLayer.removeAnimation(forKey: "strokeEnd")
        circleLayer.removeAnimation(forKey: "strokeStart")
        circleLayer.strokeColor = UIColor.clear.cgColor
    }
    
    func startLoading() {
        circleLayer.add(strokeEndAnimation, forKey: "strokeEnd")
        circleLayer.add(strokeStartAnimation, forKey: "strokeStart")
        circleLayer.strokeColor = UIColor.orange.cgColor
    }
    
    func updateAnimation() {
        if animating {
            circleLayer.add(strokeEndAnimation, forKey: "strokeEnd")
            circleLayer.add(strokeStartAnimation, forKey: "strokeStart")
        }
        else {
            circleLayer.removeAnimation(forKey: "strokeEnd")
            circleLayer.removeAnimation(forKey: "strokeStart")
        }
    }
   
}
