//
//  TableViewController.swift
//  ChatDemo
//
//  Created by DINH VAN TIEN on 9/4/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

class Message {
    var content: String?
    var date: String?

    init(content: String, date: String) {
        self.content = content
        self.date = date
    }
}

class TableViewController: UIViewController {

    @IBOutlet weak var tbChat: UITableView!
    @IBOutlet weak var tvInput: UITextView!

    var listMessage: [Message] = [] {
        didSet {
            tbChat.reloadData()
        }
    }

    let PLACEHOLDER = "Nhập tin nhắn..."

    let list = [Message(content: "gui", date: "05/09/2019"),
    Message(content: "tra loi", date: "05/09/2019"),
    Message(content: "test", date: "05/09/2019"),
    Message(content: "tra loi", date: "05/09/2019"),
    Message(content: "test", date: "05/09/2019"),
    Message(content: "tra loi", date: "05/09/2019"),
    Message(content: "test", date: "05/09/2019"),
    Message(content: "tra loi", date: "05/09/2019"),
    Message(content: "test", date: "05/09/2019"),
    Message(content: "tra loi", date: "05/09/2019"),
    Message(content: "test", date: "05/09/2019"),
    Message(content: "tra loi", date: "05/09/2019")]

    override func viewDidLoad() {
        super.viewDidLoad()
        tvInput.text = PLACEHOLDER
        tvInput.delegate = self
        tvInput.layer.borderWidth = 1
        tvInput.layer.borderColor = UIColor.gray.cgColor
        // Do any additional setup after loading the view.
        configureTableView()
        listMessage = list
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(self)
    }

    private func configureTableView() {
        tbChat.registerTableCell(MyTableViewCell.self)
        tbChat.registerTableCell(YourTableViewCell.self)
        tbChat.delegate = self
        tbChat.dataSource = self
        tbChat.rowHeight = UITableView.automaticDimension
    }


    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
            print("Notification: Keyboard will show")
//            tbChat.setBottomInset(to: keyboardHeight)
//            tbChat.scroll(to: .bottom, animated: false)
        }
    }

    @objc func keyboardWillHide(notification: Notification) {
        print("Notification: Keyboard will hide")
//        tbChat.setBottomInset(to: 0.0)
    }

    @IBAction func btnSendTapped() {
        let message = Message(content: tvInput.text, date: "05/09/2019")
        listMessage.append(contentsOf: [message])
        tbChat.beginUpdates()
        tbChat.insertRows(at: [IndexPath(row: 1, section: 0)], with: .automatic)
        tbChat.endUpdates()
//        tbChat.scroll(to: .bottom, animated: false)
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMessage.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item % 2 == 0 {
            let cell = tableView.dequeueTableCell(MyTableViewCell.self)
            cell.lbMessage.text = listMessage[indexPath.row].content
            return cell
        } else {
            let cell = tableView.dequeueTableCell(YourTableViewCell.self)
            cell.lbMessage.text = listMessage[indexPath.row].content
            return cell
        }
    }
}

extension TableViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.textColor = .black
        if textView.text == PLACEHOLDER {
            textView.text = ""
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = PLACEHOLDER
            textView.textColor = UIColor.lightGray
        }
    }
}
