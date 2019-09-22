//
//  ViewController.swift
//  syncContact
//
//  Created by DINH VAN TIEN on 4/4/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit
import Contacts
import SwiftMessages

class ViewController: UIViewController {

    let viewShow = MessageView.viewFromNib(layout: .cardView)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

    }

    @IBAction func fetchContact() {
//        var config = SwiftMessages.Config()
//
//        // Slide up from the bottom.
//        config.presentationStyle = .top
//
//        // Display in a window at the specified window level: UIWindow.Level.statusBar
//        // displays over the status bar while UIWindow.Level.normal displays under.
//        config.presentationContext = .window(windowLevel: .statusBar)
//
//        viewShow.configureTheme(.success)
//        viewShow.configureContent(title: "Warning", body: "Consider yourself warned.", iconText: "🤔")
//        SwiftMessages.show(config: config, view: viewShow)
        showBannerView()
    }

    func sync() {
        let contactStore = CNContactStore()
        var contacts = [CNContact]()
        let keys = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactPhoneNumbersKey,
            CNContactEmailAddressesKey
            ] as [Any]
        let request = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])
        do {
            try contactStore.enumerateContacts(with: request){
                (contact, stop) in
                // Array containing all unified contacts from everywhere
                contacts.append(contact)
                for phoneNumber in contact.phoneNumbers {
                    if let number = phoneNumber.value as? CNPhoneNumber, let label = phoneNumber.label {
                        let localizedLabel = CNLabeledValue<CNPhoneNumber>.localizedString(forLabel: label)
                        print("\(contact.givenName) \(contact.familyName) tel:\(localizedLabel) -- \(number.stringValue), email: \(contact.emailAddresses)")
                    }
                }
            }
            print(contacts)
        } catch {
            print("unable to fetch contacts")
        }

        let viewTest = UIView()
        viewTest.backgroundColor = .red
        viewTest.translatesAutoresizingMaskIntoConstraints = false
        viewTest.widthAnchor.constraint(equalToConstant: 200).isActive = true
        viewTest.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        showBannerView(bannerView: viewTest)
    }

    func showBannerView(){
        let bannerView = UIView()
        bannerView.backgroundColor = .red
        let window = UIApplication.shared.keyWindow!//UIWindow(frame: self.view.bounds)
        window.isHidden = false
        window.addSubview(bannerView)
        window.isOpaque = false
        window.backgroundColor = .white
        window.alpha = 0
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.topAnchor.constraint(equalTo: window.topAnchor, constant: 0).isActive = true
        bannerView.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
        bannerView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bannerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        window.windowLevel = UIWindow.Level.statusBar + 1
        window.makeKeyAndVisible()
    }
    func removeBannerView(bannerView:UIView){
        bannerView.removeFromSuperview()
        let window = UIApplication.shared.keyWindow!
        window.windowLevel = UIWindow.Level.statusBar

    }
}

