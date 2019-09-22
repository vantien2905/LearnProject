//
//  ViewController.swift
//  DemoSlider
//
//  Created by DINH VAN TIEN on 11/21/18.
//  Copyright © 2018 DINH VAN TIEN. All rights reserved.
//

import UIKit
import TGPControls

class ViewController: UIViewController {

    @IBOutlet weak var sliderTest: TGPDiscreteSlider!
    
    var path: UIBezierPath!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.path = UIBezierPath(ovalIn: CGRect(x: 10, y: 10, width: 10, height: 10))
        // Specify the fill color and apply it to the path.
        UIColor.orange.setFill()
        path.fill()
        
        // Specify a border (stroke) color.
        UIColor.purple.setStroke()
        path.stroke()
        
    }
    
    


//    func createRectangle() {
//        // Initialize the path.
//        path = UIBezierPath()
//
//        // Specify the point that the path should start get drawn.
//        path.move(to: CGPoint(x: 0.0, y: 0.0))
//        path.addArc(withCenter: CGPoint(x: 0.0, y: 0.0), radius: , startAngle: <#T##CGFloat#>, endAngle: <#T##CGFloat#>, clockwise: <#T##Bool#>)
//        // Create a line between the starting point and the bottom-left side of the view.
//        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
//
//        // Create the bottom line (bottom-left to bottom-right).
//        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
//
//        // Create the vertical line from the bottom-right to the top-right side.
//        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
//
//        // Close the path. This will create the last line automatically.
//        path.close()
//    }
}

