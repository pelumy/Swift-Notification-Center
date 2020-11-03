//
//  FirstViewController.swift
//  Notification Center Demo
//
//  Created by mac on 03/11/2020.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didReceiveColorChangeNotification(notification:)),
            name: .notifycolorChange,
            object: nil
        )
    }
    
    @objc func didReceiveColorChangeNotification(notification: Notification) {
        view.backgroundColor = .gray
        let changedText = notification.userInfo?["text"] as? String
        textLabel.text = changedText
    }
    
    deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: .notifycolorChange,
            object: nil
        )
    }
}

