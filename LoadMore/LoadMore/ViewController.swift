//
//  ViewController.swift
//  LoadMore
//
//  Created by DINH VAN TIEN on 5/7/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblDemo: UITableView!
//    @IBOutlet weak var lblCounter: UILabel!
    var arForCells:[String] = []
    let simpleCellID = "SimpleCell"
    let loadMoreCell = "LoadMoreCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tblDemo.delegate = self
        tblDemo.dataSource = self
        arForCells  = [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arForCells.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == arForCells.count){
            let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: loadMoreCell, for: indexPath as IndexPath)
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: simpleCellID, for: indexPath as IndexPath) as! test
            cell.lbContent.text = arForCells[indexPath.row]
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    @IBAction func loadMoreCells(sender: AnyObject) {
        let newAr =  ["1", "2", "3"]

        arForCells = [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
        "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
        tblDemo.reloadData()
    }

}

class test: UITableViewCell {

    @IBOutlet weak var lbContent: UILabel!


    override func awakeFromNib() {

    }
}


