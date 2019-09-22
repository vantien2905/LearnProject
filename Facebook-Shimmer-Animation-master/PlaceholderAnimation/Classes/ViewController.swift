//
//  ViewController.swift
//  PlaceholderAnimation
//
//  Created by Yudiz on 30/05/18.
//  Copyright © 2018 Yudiz. All rights reserved.
//

import UIKit

extension UIView {

    func startLoading() {
        for animateView in getSubviewsInner(view: self) {
            animateView.startAnimationLoading()
        }
    }

    func stopLoading() {
        for animateView in getSubviewsInner(view: self) {
            animateView.stopAnimationLoading()
        }
    }

    func getSubviewsInner(view: UIView) -> [UIView] {
        var subviewArray = [UIView]()
        guard view.subviews.count > 0 else { return subviewArray }
        view.subviews.forEach {

            if let label = $0 as? UILabel {
                subviewArray.append(label)
            }

            if let image = $0 as? UIImageView {
                subviewArray.append(image)
            }

            subviewArray += self.getSubviewsInner(view: $0)
        }
        return subviewArray
    }
}

/// ViewController
class ViewController: UIViewController {

    /// IBOutlet(s)
    @IBOutlet weak var tableView: UITableView!
    
    /// Variable Declaration(s)
    var isAnimateStart: Bool = false

    /// View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startLoading()
    }
}

// MARK: - Animation Related
extension ViewController {

    func startLoading() {
        self.view.startLoading()
    }
    
    func stopLoading() {
        self.view.stopLoading()
    }
}

// MARK: - UIButton Action(s)
extension ViewController {
    
    @IBAction func tapBtnRefresh(_ sender: UIBarButtonItem) {
        if isAnimateStart {
            startLoading()
            sender.title = "Stop"
        } else {
            stopLoading()
            sender.title = "Start"
        }
        isAnimateStart = !isAnimateStart
    }
}

// MARK: - UITableView Delegate and DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



var gradientLayerKey = "gradientLayer"
var overlayViewKey = "overlayView"

extension UIColor {

    class func backgroundGray() -> UIColor {
        return UIColor(red: 246.0 / 255, green: 247 / 255, blue: 248 / 255, alpha: 1)
    }

    class func lightGray() -> UIColor {
        return UIColor(red: 238.0 / 255, green: 238 / 255, blue: 238 / 255, alpha: 1)
    }

    class func darkGray() -> UIColor {
        return UIColor(red: 221.0 / 255, green: 221 / 255, blue: 221 / 255, alpha: 1)
    }

}

class OverlayView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context = UIGraphicsGetCurrentContext()
        // Set màu cho context và đổ màu trắng toàn bộ view
        context?.setFillColor(UIColor.lightGray.cgColor)
        context?.fill(bounds)
        // Set blend mode và màu trong suốt để chuẩn bị 'đục lỗ'
        context?.setBlendMode(.clear)
        context?.setFillColor(UIColor.clear.cgColor)
        // Tìm tất cả các subview của contentView, trừ chính overlay view và đổ màu trong suốt
        superview?.subviews.forEach({
            if $0 != self {
                context?.fill($0.frame)
            }
        })
    }

}

extension UIView {

    func startAnimationLoading() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [
            UIColor.backgroundGray().cgColor,
            UIColor.lightGray().cgColor,
            UIColor.darkGray().cgColor,
            UIColor.lightGray().cgColor,
            UIColor.backgroundGray().cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: -0.85, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1.15, y: 0)
        gradientLayer.locations = [-0.85, -0.85, 0, 0.15, 1.15]
        // Khởi tạo CABasicAnimation với keyPath muốn animate là `locations`
        let animation = CABasicAnimation(keyPath: "locations")
        // Giá trị `locations` bắt đầu animate
        animation.fromValue = gradientLayer.locations
        // Giá trị `locations` kết thúc animate
        animation.toValue = [0, 1, 1, 1.05, 1.15]
        // Lặp animation vô hạn
        animation.repeatCount = .infinity
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.duration = 1
        // Add animation cho gradient layer
        gradientLayer.add(animation, forKey: "loading.animation")
        addOverlayView()
        layer.addSublayer(gradientLayer)

        objc_setAssociatedObject(self, &gradientLayerKey, gradientLayer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }



    func stopAnimationLoading() {
        let overlayView = objc_getAssociatedObject(self, &overlayViewKey) as? OverlayView
        let gradientLayer = objc_getAssociatedObject(self, &gradientLayerKey) as? CAGradientLayer
        overlayView?.removeFromSuperview()
        gradientLayer?.removeFromSuperlayer()
    }

    private func addOverlayView() {
        let overlayView = OverlayView()
        overlayView.frame = bounds
        overlayView.backgroundColor = .clear
        addSubview(overlayView)
        objc_setAssociatedObject(self, &overlayViewKey, overlayView, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

}
