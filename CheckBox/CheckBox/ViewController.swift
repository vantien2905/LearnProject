//
//  ViewController.swift
//  CheckBox
//
//  Created by DINH VAN TIEN on 11/19/18.
//  Copyright © 2018 DINH VAN TIEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    @IBOutlet weak var slider: UISlider!
    let check = UIImage(named: "check")
    let uncheck = UIImage(named: "uncheck")

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnTapped(_ sender: UIButton) {
        switch sender {
        case btn1:
            isCheck(btn1)
        case btn2:
            isCheck(btn2)
        case btn3:
            isCheck(btn3)
        default:
            break
        }
    }
    
    func isCheck(_ button: UIButton) {
        for btn in [btn1, btn2, btn3] {
            if btn != button {
                btn?.setImage(uncheck, for: .normal)
            } else {
                button.setImage(check, for: .normal)
            }
        }
    }
}

