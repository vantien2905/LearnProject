//
//  ViewController.swift
//  TestUnZipFile
//
//  Created by DINH VAN TIEN on 6/25/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit
import SSZipArchive

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        unzip()
    }

    private func unzip() {
        let userManager = FileManager.default
        let mobipath = Bundle.main.path(forResource: "hanh phuc that don gian", ofType: "mobi")!
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let success: Bool = SSZipArchive.unzipFile(atPath: mobipath,
                                                   toDestination: documentsPath,
                                                   preserveAttributes: true,
                                                   overwrite: true,
                                                   nestedZipLevel: 1,
                                                   password: nil,
                                                   error: nil,
                                                   delegate: nil,
                                                   progressHandler: nil,
                                                   completionHandler: nil)
        if success != false {
            print("Success unzip")
        } else {
            print("No success unzip")
        }
    }


}

