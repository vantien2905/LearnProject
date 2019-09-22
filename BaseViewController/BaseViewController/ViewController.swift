//
//  ViewController.swift
//  BaseViewController
//
//  Created by DINH VAN TIEN on 9/15/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit
import DTTableViewManager
import DTModelStorage

class ViewController: UIViewController, DTTableViewManageable {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        manager.startManaging(withDelegate: self)
//        manager.register(StringCell.self)
//        manager.memoryStorage.addItems(["1","2","3"])
        manager.startManaging(withDelegate: self)
        manager.register(CustomStringCell.self)
        manager.registerHeader(CustomHeaderFooterView.self)
        manager.registerFooter(CustomHeaderFooterView.self)

        manager.memoryStorage.setSectionHeaderModel(("Awesome custom header", UIImage(named: "Test")!), forSection: 0)
        manager.memoryStorage.setSectionFooterModel(("Not so awesome custom footer", UIImage(named: "Test")!), forSection: 0)

        let foo = ["Custom cell", "Custom cell 2"]
        manager.memoryStorage.addItems(foo)
    }


}

