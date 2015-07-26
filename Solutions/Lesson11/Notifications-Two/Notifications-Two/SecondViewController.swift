//
//  SecondViewController.swift
//  Notifications-Two
//
//  Created by LOANER on 7/8/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var mySingleton = Singleton.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()

        let center = NSNotificationCenter.defaultCenter()
//        center.addObserver(self, selector: "doChangeBackground:", name: "changeBackground", object: nil)
        
        println("\(mySingleton.age)")
    }
    
    func doChangeBackground(notification: NSNotification) {
        let info = notification.userInfo!
        self.view.backgroundColor = info["color"] as? UIColor
    }

    @IBAction func makeGreen(sender: UIButton) {
        let info = ["color": UIColor.greenColor()]
        
        let center = NSNotificationCenter.defaultCenter()
        center.postNotificationName("changeBackground", object: self, userInfo: info)
        
        mySingleton.age = 20
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
