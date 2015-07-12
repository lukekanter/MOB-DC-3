//
//  ViewController.swift
//  Lesson11-Notifications
//
//  Created by Arthur Sabintsev on 7/8/15.
//  Copyright (c) 2015 Arthur Ariel Sabintsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(self,
            selector: "receiver:",
            name: "Hello, World!",
            object: nil)
        
    }
    
    func receiver(notification: NSNotification) {
        println("Notification received!")
    }

}

