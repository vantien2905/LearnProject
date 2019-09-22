//
//  UIViewController+Extension.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/2/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

extension UIViewController {

    static func initFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>(_ : T.Type) -> T {
            return T(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib(self)
    }

    static func initFrom(storyboardName: String) -> Self {
        func instantiateFromStoryboard<T: UIViewController>(_ : T.Type) -> T {
            guard let vc = UIStoryboard(name: storyboardName,
                                        bundle: nil).instantiateViewController(withIdentifier: String(describing: T.self)) as? T else {
                                            return T.init()
                                            
            }
            return vc
        }

        return instantiateFromStoryboard(self)
    }
}

func enumCount<T: Hashable>(_: T.Type) -> Int {
    var i = 1
    while (withUnsafePointer(to: &i, {
        return $0.withMemoryRebound(to: T.self, capacity: 1, { return $0.pointee })
    }).hashValue != 0) {
        i += 1
    }
    return i
}

extension UIViewController {
    func push(controller: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(controller, animated: animated)
    }

    func pop(animated: Bool = true ) {
        self.navigationController?.popViewController(animated: animated)
    }

    func present(controller: UIViewController, animated: Bool = true) {
        self.present(controller, animated: animated, completion: nil)
    }

    func dismiss(animated: Bool = true) {
        self.dismiss(animated: animated, completion: nil)
    }
}
