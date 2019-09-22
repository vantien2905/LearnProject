//
//  PushViewController.swift
//  Dynamics Demo
//
//  Created by Joyce Echessa on 8/26/14.
//  Copyright (c) 2014 Joyce Echessa. All rights reserved.
//

import UIKit

class PushViewController: UIViewController {
    
    var redSquareView: UIView!
    var blueSquareView: UIView!
    var animator: UIDynamicAnimator!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        redSquareView = UIView(frame: CGRect(x: 40, y: 100, width: 50, height: 50))
        redSquareView.backgroundColor = UIColor.red
        view.addSubview(redSquareView)
        
        blueSquareView = UIView(frame: CGRect(x: 220, y: 100, width: 50, height: 50))
        blueSquareView.backgroundColor = UIColor.blue
        view.addSubview(blueSquareView)
        
        let continuousPush: UIPushBehavior = UIPushBehavior(items: [redSquareView], mode: UIPushBehavior.Mode.continuous)
        let instantaneousPush: UIPushBehavior = UIPushBehavior(items: [blueSquareView], mode: UIPushBehavior.Mode.instantaneous)
        
        continuousPush.setAngle( CGFloat(Double.pi/2) , magnitude: 0.3);
        instantaneousPush.setAngle( CGFloat(Double.pi/2) , magnitude: 0.3);
        
        animator = UIDynamicAnimator(referenceView: view)
        animator.addBehavior(continuousPush)
        animator.addBehavior(instantaneousPush)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
