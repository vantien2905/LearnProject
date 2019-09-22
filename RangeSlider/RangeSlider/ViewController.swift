//
//  ViewController.swift
//  RangeSlider
//
//  Created by DINH VAN TIEN on 3/21/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var vSlider: RangeSlider!

    lazy var vAdd: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        vSlider.rangeValues = Array(0...50)

    }

    @IBAction func btnShowViewTapped() {

        vAdd.frame = UIApplication.shared.keyWindow!.frame
//        UIApplication.shared.keyWindow?.insertSubview(vAdd, at: 3)
//        UIApplication.shared.keyWindow!.addSubview(vAdd)
//        view.addSubview(vAdd)
//        vAdd.frame = CGRect(x: 0, y: 0, width: 250, height: 100)
        if let newStatusBarScreenShot = statusBarScreenShot() {
//            statusBarScreenShotView = newStatusBarScreenShot
            view.insertSubview(vAdd, aboveSubview: newStatusBarScreenShot)
            view.layoutSubviews()
        }
    }

    private func statusBarScreenShot() -> UIView? {
        let statusBarFrame = UIApplication.shared.statusBarFrame
        let screenshot = UIScreen.main.snapshotView(afterScreenUpdates: false)
        screenshot.frame = statusBarFrame
        screenshot.contentMode = .top
        screenshot.clipsToBounds = true
        return screenshot
    }


}

