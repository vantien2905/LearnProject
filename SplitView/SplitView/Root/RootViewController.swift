//
//  RootViewController.swift
//  SplitView
//
//  Created by DINH VAN TIEN on 3/12/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    @IBOutlet weak var vMenu: UIView!
    @IBOutlet weak var vDetail: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        let child1 = Child1ViewController.init(nibName: "Child1ViewController", bundle: nil)
        let child2 = Child2ViewController.init(nibName: "Child1ViewController", bundle: nil)
        self.addChild(child1)
        self.addChild(child2)
        child1.view.frame = vMenu.frame//CGRect(x: 0, y: 0, width: 150, height: 375)
        child2.view.frame = vDetail.frame//CGRect(x: 150, y: 0, width: 150, height: 375)
        self.view.addSubview(child1.view)
        self.view.addSubview(child2.view)
    }
}
