//
//  HomeViewController.swift
//  demoTableView
//
//  Created by DINH VAN TIEN on 11/7/18.
//  Copyright © 2018 DINH VAN TIEN. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tbHome: UITableView!

    let cellId = "HomeCell"
    let headerId = "HeaderCell"
    let footerId = "FooterCell"
    let slideId = "SlideCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        configureTableView()
    }
    
    var titleList = ["haah", "hehe"]
    var notMore = true
    var numberCell = [["a", "b", "c"],["a", "b", "c"]] {
        didSet {
            if notMore {
                self.tbHome.reloadData()
            }
            
        }
    }
    var numberCellTemp = [["a", "b", "c", "d", "e", "f"],["a", "b", "c"]]
    func configureTableView() {
        tbHome.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        tbHome.register(UINib(nibName: footerId, bundle: nil), forCellReuseIdentifier: footerId)
        tbHome.register(UINib(nibName: slideId, bundle: nil), forCellReuseIdentifier: slideId)
        tbHome.register(UINib(nibName: headerId, bundle: nil), forCellReuseIdentifier: headerId)
        tbHome.delegate = self
        tbHome.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberCell.count + 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return numberCell[section - 1].count + 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: slideId, for: indexPath) as! SlideCell
            
            return cell
        } else {
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: headerId, for: indexPath) as! HeaderCell
                cell.lbName.text = titleList[indexPath.section - 1]
                return cell
            case numberCell[indexPath.section - 1].count + 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: footerId, for: indexPath) as! FooterCell
                cell.delegate = self
                cell.section = indexPath.section
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HomeCell
                cell.lbTitle.text = numberCell[indexPath.section - 1][indexPath.row - 1]
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 300
        } else {
            return 80
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: headerId)
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableCell(withIdentifier: footerId) as! FooterCell
        footer.delegate = self
        footer.section = section
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
             return 0
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 0
        }
        
    }
}

extension HomeViewController: FooterCellDelegate {
    func moreTapped(section: Int) {
        notMore = false
        let data = numberCellTemp[section - 1].dropFirst(3)
        let firstIndex = numberCell[section - 1].count
        numberCell[section - 1].append(contentsOf: data)
        let lastIndex = numberCell[section - 1].count
        tbHome.beginUpdates()
        let indexPaths = (firstIndex..<lastIndex).map { IndexPath(row: $0, section: section) }
        tbHome.insertRows(at: indexPaths, with: .bottom)
        tbHome.endUpdates()
    }
}
