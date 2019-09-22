//
//  ViewController.swift
//  SlideImage
//
//  Created by DINH VAN TIEN on 7/22/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SlideViewDataSource, SlideViewDelegate {
    func numberOfItems(in pagerView: SlideView) -> Int {
        return 5
    }

    func pagerView(_ pagerView: SlideView, cellForItemAt index: Int) -> SlideViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.backgroundColor = .red
        cell.imageView?.contentMode = .scaleAspectFill
        cell.textLabel?.text = "Test title: \(index)"
        cell.imageView?.clipsToBounds = true
        return cell
    }

    @IBOutlet weak var pagerView: SlideView! {
        didSet {
            self.pagerView.register(SlideViewCell.self, forCellWithReuseIdentifier: "cell")
            self.typeIndex = 0
            self.pagerView.automaticSlidingInterval = 2
        }
    }

    fileprivate var typeIndex = 0 {
        didSet {

            self.pagerView.transformer = SlideViewTransformer(type:.cubic)
            let transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.pagerView.itemSize = self.pagerView.frame.size.applying(transform)
            self.pagerView.decelerationDistance = 1
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pagerView.delegate = self
        pagerView.dataSource = self
    }


}

