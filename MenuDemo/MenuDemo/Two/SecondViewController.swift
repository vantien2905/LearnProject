//
//  TwoViewController.swift
//  MenuDemo
//
//  Created by DINH VAN TIEN on 11/23/18.
//  Copyright © 2018 DINH VAN TIEN. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var tbProcedure: UITableView!
    
    weak var delegate: FirstViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let actualPosition = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        self.view.layoutIfNeeded()
        if actualPosition.y > 0 {
            delegate?.isShowHeaderView(true)
        } else {
            delegate?.isShowHeaderView(false)
        }
    }
}
