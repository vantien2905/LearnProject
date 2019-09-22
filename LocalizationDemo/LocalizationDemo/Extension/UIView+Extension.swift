//
//  UIView+Extension.swift
//  LocalizationDemo
//
//  Created by DINH VAN TIEN on 1/27/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation
import UIKit

postfix operator *

postfix func *<T>(element: T?) -> Int {
    return (element == nil) ? 0: Int("\(element!)")!
}

postfix operator &

postfix func & <T>(element: T?) -> String {
    return (element == nil) ? "" : "\(element!)"
}

postfix func & <T>(element: T) -> String {
    return "\(element)"
}


var isDefault = true
var localize: [String: String] = [:]
var localizeDefault: [String: String] = [:]
extension UIView {
    
    @IBInspectable var localizationKey: String? {
        get {
            return self.accessibilityIdentifier
        }
        set {
            return self.accessibilityIdentifier = newValue
        }
    }
    
    static var getClassName: String {
        return String(describing: self)
    }
    
    private var viewInfo: String {
        return "\(classForCoder), frame: \(frame))"
    }
    
    func loadTextLocalization(classType: AnyClass, isDefault: Bool = true) {
        let classNameString = String(describing: classType)
        _ = loadText(parentView: self, className: classNameString, isDefault: isDefault)
    }
    
    //--Load localize
    private func loadText(parentView: UIView, level: Int = 0, className: String = "", isDefault: Bool = true) {
        
        for subview in parentView.subviews {
            if let identify = subview.localizationKey {
                let key = "\(className).\(identify)"
                
                if let label = subview as? UILabel  {
                    if localize[key] != nil {
                        label.text = isDefault ? localizeDefault[key] : localize[key]
                    }
                }
                
                if let button = subview as? UIButton {
                    if localize[key] != nil {
                        button.setTitle(isDefault ? localizeDefault[key] : localize[key], for: .normal)
                    }
                }
                
                if let textField = subview as? UITextField {
                    if localize[key] != nil {
                        textField.placeholder = isDefault ? localizeDefault[key] : localize[key]
                    }
                }
            }
            if subview.subviews.count != 0 {
                loadText(parentView: subview, level: level + 1, className: className)
            }
        }
    }
    
    func saveToJsonFile() {
        // Get the url of Persons.json in document directory
        guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileUrl = documentDirectoryUrl.appendingPathComponent("Localization.json")
        let textArray = isDefault ? localizeDefault : localize
        // Transform array into data and save it into file
        do {
            let data = try JSONSerialization.data(withJSONObject: textArray, options: [])
            try data.write(to: fileUrl, options: [])
        } catch {
            print(error)
        }
    }
    
    
    func createResourceLocalization(className: AnyClass) {
        let classNameString = String(describing: className)
        _ = subviews(parentView: self, className: classNameString)
    }
    
    //---create resource
    private func subviews(parentView: UIView, level: Int = 0, className: String = "") {
        //        localize.removeAll()
        for subview in parentView.subviews {
            
            if let identify = subview.localizationKey {
                let key = "\(className).\(identify)"
                
                //-------Check view type
                if let _ = subview as? UILabel {
                    localize[key] = "Label"
                    saveToJsonFile()
                }
                
                if let _ = subview as? UIButton {
                    localize[key] = "Button"
                    saveToJsonFile()
                }
                
                if let _ = subview as? UITextField {
                    localize[key] = "Placeholder"
                    saveToJsonFile()
                }
            }
            
            //Recursive find all view
            if subview.subviews.count != 0 {
                subviews(parentView: subview, level: level + 1, className: className)
            }
        }
    }
    ///---Default
    func createResourceLocalizationDefault(className: AnyClass) {
        let classNameString = String(describing: className)
        _ = subviewsDefault(parentView: self, className: classNameString)
    }
    
    //---create resource
    private func subviewsDefault(parentView: UIView, level: Int = 0, className: String = "") {
        //        localize.removeAll()
        for subview in parentView.subviews {
            
            if let identify = subview.localizationKey {
                let key = "\(className).\(identify)"
                
                //-------Check view type
                if let label = subview as? UILabel {
                    localizeDefault[key] = "\(label.text&)"
                    saveToJsonFile()
                }
                
                if let button = subview as? UIButton {
                    localizeDefault[key] = "\(button.title(for: .normal)&)"
                    saveToJsonFile()
                }
                
                if let textField = subview as? UITextField {
                    localizeDefault[key] = "\(textField.placeholder&)"
                    saveToJsonFile()
                }
            }
            
            //Recursive find all view
            if subview.subviews.count != 0 {
                subviews(parentView: subview, level: level + 1, className: className)
            }
        }
    }
}

extension String {
    func saveToJsonFile() {
        // Get the url of Persons.json in document directory
        guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileUrl = documentDirectoryUrl.appendingPathComponent("Localization.json")
        let textArray =  localize
        // Transform array into data and save it into file
        do {
            let data = try JSONSerialization.data(withJSONObject: textArray, options: [])
            try data.write(to: fileUrl, options: [])
        } catch {
            print(error)
        }
    }
    
    func localization(classType: AnyClass) -> String {
        let className = String(describing: classType)
        let key = "\(className).\(self)"
//        #if LOCAL
        if isDefault {
            localize[key] = self
        } else {
            localize[key] = "Test Programming"
        }
        saveToJsonFile()
//        #else
//
//        #endif
        
        return localize[key]&
    }
}
