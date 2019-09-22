//
//  HomeViewController.swift
//  TestSizeClass
//
//  Created by DINH VAN TIEN on 7/17/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
    }


    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)

        coordinator.animate(alongsideTransition: { [unowned self] _ in
            if newCollection.verticalSizeClass == .compact {
                self.view.backgroundColor = UIColor.red
            } else {
                self.view.backgroundColor = UIColor.green
            }
        }) { [unowned self] _ in
            self.view.backgroundColor = UIColor.blue
        }
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
