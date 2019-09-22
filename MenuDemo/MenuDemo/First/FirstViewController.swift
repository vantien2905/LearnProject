//
//  FirstViewController.swift
//  MenuDemo
//
//  Created by DINH VAN TIEN on 11/23/18.
//  Copyright © 2018 DINH VAN TIEN. All rights reserved.
//

import UIKit

protocol FirstViewControllerDelegate: class {
    func isShowHeaderView(_ value: Bool)
}

class FirstViewController: UIViewController {

    @IBOutlet weak var tbFirst: UITableView!
    
    weak var delegate: FirstViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
    }


    func configureTableView() {
        tbFirst.registerTableCell(MenuCell.self)
        tbFirst.delegate = self
        tbFirst.dataSource = self
    }
}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTableCell(MenuCell.self)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let actualPosition = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        self.view.layoutIfNeeded()
        if actualPosition.y > 0 {
            delegate?.isShowHeaderView(true)
        } else {
            delegate?.isShowHeaderView(false)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
