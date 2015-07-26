//
//  ViewController.swift
//  Notifications-Two
//
//  Created by LOANER on 7/8/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mySingleton = Singleton.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(self, selector: "doChangeBackground:", name: "changeBackground", object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        println("\(mySingleton.age)")
    }

    func doChangeBackground(notification: NSNotification) {
        let info = notification.userInfo!
        self.view.backgroundColor = info["color"] as? UIColor
    }
    
    @IBAction func makeBlue(sender: UIButton) {
        let info = ["color": UIColor.blueColor()]
        
        let center = NSNotificationCenter.defaultCenter()
        center.postNotificationName("changeBackground", object: self, userInfo: info)
    }


}

