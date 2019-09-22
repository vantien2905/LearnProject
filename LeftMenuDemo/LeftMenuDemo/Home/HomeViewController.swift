//
//  HomeViewController.swift
//  LeftMenuDemo
//
//  Created DINH VAN TIEN on 4/24/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class HomeViewController: UIViewController, HomeViewProtocol {

	var presenter: HomePresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setNeedsStatusBarAppearanceUpdate()
        let image = UIImage(named: "filter")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: self, action: #selector(goBack))
        SideMenuController.preferences.basic.menuWidth = 240
        SideMenuController.preferences.basic.statusBarBehavior = .hideOnMenu
    }

    @objc func goBack() {
        self.sideMenuController?.revealMenu()
    }

}
