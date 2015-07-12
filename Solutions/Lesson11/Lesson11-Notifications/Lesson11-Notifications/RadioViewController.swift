//
//  RadioViewController.swift
//  Lesson11-Notifications
//
//  Created by Arthur Sabintsev on 7/8/15.
//  Copyright (c) 2015 Arthur Ariel Sabintsev. All rights reserved.
//

import Foundation
import UIKit

class RadioViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func postAction(sender: UIButton) {
        let notification = NSNotification(name: "Hello, World!", object: self)
        let center = NSNotificationCenter.defaultCenter()
        center.postNotification(notification)
    }
}
