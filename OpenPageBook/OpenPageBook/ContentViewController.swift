//
//  ContentViewController.swift
//  OpenPageBook
//
//  Created by DINH VAN TIEN on 6/17/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    var dataObject: AnyObject?
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let storyBoard = UIStoryboard(name: "Main",
//                                      bundle: Bundle.main)
//        let dataViewController =
//            storyBoard.instantiateViewController(withIdentifier: "contentView")
//                as! ContentViewController
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        webView.loadHTMLString(dataObject as! String,
                               baseURL: NSURL(string: "") as URL?)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
