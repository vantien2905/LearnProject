//
//  HomeViewController.swift
//  ReadFileDemo
//
//  Created by DINH VAN TIEN on 12/12/18.
//  Copyright © 2018 DINH VAN TIEN. All rights reserved.
//

import UIKit
import WebKit

class HomeViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "http://demo2.engma.com.vn/public/upload/file/project/b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b/BAO_CAO_DAU_TU_TIENDO.pdf")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}
