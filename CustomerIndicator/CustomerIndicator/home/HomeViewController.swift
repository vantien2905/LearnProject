//
//  HomeViewController.swift
//  CustomerIndicator
//
//  Created by DINH VAN TIEN on 12/19/18.
//  Copyright © 2018 DINH VAN TIEN. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var vIndicator: Indicator!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
    }


    @IBAction func btnStopLoadingTapped() {
        vIndicator.stopLoading()
    }
    
    @IBAction func btnStartLoadingTapped() {
        vIndicator.startLoading()
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
