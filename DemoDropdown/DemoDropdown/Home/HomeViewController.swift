//
//  HomeViewController.swift
//  DemoDropdown
//
//  Created by DINH VAN TIEN on 12/17/18.
//  Copyright © 2018 DINH VAN TIEN. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tbLeft: UITableView!
    @IBOutlet weak var tbRight: UITableView!
    @IBOutlet weak var tfMenu: UITextField!
    @IBOutlet weak var heightLeft: NSLayoutConstraint!
    @IBOutlet weak var heightRight: NSLayoutConstraint!
    @IBOutlet weak var btnHideDropdown: UIButton!
    
    let cellId = "CellID"
    var shownIndexes : [IndexPath] = []
    
    let menu = [Menu(title: "title1", listContent: ["a", "b", "c", "d"]),
                Menu(title: "title2", listContent: ["a", "b"]),
                Menu(title: "title3", listContent: ["a", "b", "c"]),
                Menu(title: "title4", listContent: ["a", "b", "c"]),
                Menu(title: "title5", listContent: ["a"]),
                Menu(title: "title6", listContent: ["a", "b", "c"]),
                Menu(title: "title7", listContent: ["a", "b", "c", "e", "f", "g", "h"]),
                Menu(title: "title8", listContent: ["a", "b", "c"]),
                Menu(title: "title9", listContent: ["a", "b"]),
                Menu(title: "title1", listContent: ["a", "b", "c", "d"]),
                Menu(title: "title2", listContent: ["a", "b"]),
                Menu(title: "title3", listContent: ["a", "b", "c"]),
                Menu(title: "title4", listContent: ["a", "b", "c"]),
                Menu(title: "title5", listContent: ["a"]),
                Menu(title: "title6", listContent: ["a", "b", "c"]),
                Menu(title: "title7", listContent: ["a", "b", "c", "e", "f", "g", "h"]),
                Menu(title: "title8", listContent: ["a", "b", "c"]),
                Menu(title: "title9", listContent: ["a", "b"]),
                Menu(title: "title10", listContent: ["a", "b", "c"])]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTableView()
    }
    
   
    
    func configureTableView() {
        tbLeft.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: cellId)
        tbRight.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: cellId)
        tbRight.delegate = self
        tbRight.dataSource = self
        tbLeft.delegate = self
        tbLeft.dataSource = self
        tbRight.rowHeight = UITableView.automaticDimension
        tbLeft.rowHeight = UITableView.automaticDimension
        tfMenu.delegate = self
        hideDropdown()
        tbLeft.layer.cornerRadius = 10
        tbRight.layer.cornerRadius = 10
        
    }
    
    @IBAction func btnDropdownTapped() {
        tbLeft.isHidden = false
        tbLeft.reloadData()
        btnHideDropdown.isHidden = false
    }
    
    @IBAction func hideDropdownTapped() {
        hideDropdown()
    }
    
    func hideDropdown() {
        tbRight.isHidden = true
        tbLeft.isHidden = true
        btnHideDropdown.isHidden = true
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case tbLeft:
            return menu.count
        case tbRight:
            return menu[index].listContent.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let heightContent = tableView.contentSize.height
        let heightMax = UIScreen.main.bounds.maxY - tfMenu.frame.maxY - 50
        switch tableView {
        case tbLeft:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
            self.heightLeft.constant = heightContent < heightMax ? tableView.contentSize.height : (heightMax)
            return cell
           
        case tbRight:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
            self.heightRight.constant = heightContent < heightMax ? tableView.contentSize.height : (heightMax)
            return cell
        default:
            self.heightLeft.constant = tableView.contentSize.height
            self.heightRight.constant = tableView.contentSize.height
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case tbLeft:
            index = indexPath.row
            tbRight.reloadData()
            tbRight.isHidden = false
        default:
            break
        }
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if (shownIndexes.contains(indexPath) == false) {
            shownIndexes.append(indexPath)
            
            cell.transform = CGAffineTransform(translationX: 0, y: 1)
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 10, height: 10)
            cell.alpha = 0
            
            UIView.beginAnimations("rotation", context: nil)
            UIView.setAnimationDuration(0.5)
            cell.transform = CGAffineTransform(translationX: 0, y: 0)
            cell.alpha = 1
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            UIView.commitAnimations()
        }

//        cell.transform = CGAffineTransform(translationX: -tableView.bounds.width, y: 0)
//
//        UIView.animate(
//            withDuration: 0.2,
//            delay: 0.1 * Double(indexPath.row),
//            options: [.curveEaseInOut],
//            animations: {
//                cell.transform = CGAffineTransform(translationX: 0, y: 0)
//        })
    }
}

class Menu {
    var title: String
    var listContent: [String]
    init(title: String, listContent: [String]) {
        self.title = title
        self.listContent = listContent
    }
}
