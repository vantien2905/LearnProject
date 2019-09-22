//
//  ContainerViewController.swift
//  LeftMenuDemo
//
//  Created by DINH VAN TIEN on 5/2/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

class ContainerViewController: SideMenuController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
    }

    private func initViewController() {
        let home = HomeRouter.createModule()
        home.view.backgroundColor = .red
        let menu = HomeRouter.createModule()
        menu.view.backgroundColor = .green
        self.contentViewController = home
        self.menuViewController = menu
    }
}
