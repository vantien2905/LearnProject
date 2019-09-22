//
//  ViewController.swift
//  TESTAnimation
//
//  Created by DINH VAN TIEN on 6/28/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

extension UIView {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.4
        pulse.fromValue = 0.9
        pulse.toValue = 1.0
//        pulse.autoreverses = true
//        pulse.repeatCount = 1
//        pulse.initialVelocity = 0.5
//        pulse.damping = 5.0
        self.layer.add(pulse, forKey: nil)
    }
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.3
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 2
        layer.add(flash, forKey: nil)
    }
}

class LoaderHelper {

    lazy var vDark: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    lazy var vAnimation: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    static let shared = LoaderHelper()

    func showLoader(view: UIView) {

        vDark.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width*5, height: UIScreen.main.bounds.height)
        view.addSubview(vDark)
        vAnimation.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width*5, height: UIScreen.main.bounds.height)
        view.addSubview(vAnimation)

        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.clear.cgColor]
        gradient.locations = [0, 0.5, 1]
        gradient.frame = vAnimation.frame

        let angle = -45 * CGFloat.pi / 180
        gradient.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        vAnimation.layer.mask = gradient

        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 1.5
        animation.fromValue = -view.frame.width*5
        animation.toValue = view.frame.width*5
        animation.repeatCount = Float.infinity
        gradient.add(animation, forKey: "test")
        //        view.layer.addSublayer(gradient)
    }

    func hideLoader() {
        vAnimation.removeFromSuperview()
    }
}

class ViewController: UIViewController {

    lazy var vAnimation: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    lazy var buttonHide: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(btnHideTapped), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        LoaderHelper.shared.showLoader(view: view)
        buttonHide.frame = CGRect(x: view.frame.minX+50, y: view.frame.maxY - 100, width: 100, height: 50)
        view.addSubview(buttonHide)
//        setData()
    }

    @objc func btnHideTapped() {
        LoaderHelper.shared.hideLoader()
    }


    private func setData() {
        vAnimation.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width*5, height: UIScreen.main.bounds.height)
        view.addSubview(vAnimation)

        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradient.locations = [0, 0.5, 1]
        gradient.frame = vAnimation.frame

        let angle = -45 * CGFloat.pi / 180
        gradient.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        vAnimation.layer.mask = gradient

        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 2
        animation.fromValue = -view.frame.width*5
        animation.toValue = view.frame.width*5
        animation.repeatCount = Float.infinity
        gradient.add(animation, forKey: "test")
//        view.layer.addSublayer(gradient)
    }


    @IBAction func btnPULSEtapped(sender: UIButton) {
        sender.pulsate()
    }

    @IBAction func btnFLASHtapped(sender: UIButton) {
        sender.flash()
    }
}

