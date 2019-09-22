//
//  HomeViewController.swift
//  LocalizationDemo
//
//  Created by DINH VAN TIEN on 1/27/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var btnChangeLanguage: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.createResourceLocalizationDefault(className: HomeViewController.self)
        self.view.createResourceLocalization(className: HomeViewController.self)
        self.view.loadTextLocalization(classType: HomeViewController.self)
    }
    
    @IBAction func btnChangeLanguageTapped() {
        btnChangeLanguage.isSelected = !btnChangeLanguage.isSelected
        isDefault = !isDefault
//        self.view.createResourceLocalization(className: HomeViewController.self)
        self.view.loadTextLocalization(classType: HomeViewController.self, isDefault: isDefault)
        self.view.setNeedsDisplay()
    }
}
