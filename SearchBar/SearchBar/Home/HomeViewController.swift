//
//  HomeViewController.swift
//  SearchBar
//
//  Created by DINH VAN TIEN on 3/21/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var slider: RangeSlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.setValueChangedCallback { (minValue, maxValue) in
            print("rangeSlider min value:\(minValue)")
            print("rangeSlider max value:\(maxValue)")
        }

        slider.setMinAndMaxRange(10, maxRange: 20)
        
        
    }
}
