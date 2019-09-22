//
//  HomeViewController.swift
//  MenuDemo
//
//  Created by DINH VAN TIEN on 11/23/18.
//  Copyright © 2018 DINH VAN TIEN. All rights reserved.
//

import UIKit

class HomeViewController: PageViewController {
    
    @IBOutlet weak var vTest: UIView!
    var itemMenus = [
        Category(title: "THÔNG TIN", isSelected: true, image: UIImage()),
        Category(title: "QUY TRÌNH", isSelected: false, image: UIImage())
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .blue
        let firstVC = FirstViewController.initFromNib()
        firstVC.delegate = self
        
        let secondVC = SecondViewController.initFromNib()
        secondVC.delegate = self
        
        self.controllers = [firstVC, secondVC]
        super.setUpViewMenu(menuColorBackground: UIColor.white, menuFont: UIFont.boldSystemFont(ofSize: 15), menuColorNormal: UIColor.orange, menuColorSelected: UIColor.orange, menuColorHorizontal: UIColor.orange, heightHorizontal: 5, listItem: itemMenus, isFull: true, isHaveLineTop: false, heightHeader: 50)
      
    }
}

extension HomeViewController: FirstViewControllerDelegate {
    func isShowHeaderView(_ value: Bool) {
        if value {
            UIView.animate(withDuration: 0.3) {
                self.lcHeightHeader?.constant = 50
                self.view.layoutIfNeeded()
            }
            
        } else {
            UIView.animate(withDuration: 0.3) {
                self.lcHeightHeader?.constant = 0
                self.view.layoutIfNeeded()
            }
        }
    }
}
