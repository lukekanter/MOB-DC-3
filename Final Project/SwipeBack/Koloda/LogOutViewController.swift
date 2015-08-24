//
//  LogOutViewController.swift
//  Koloda
//
//  Created by Luke Kanter on 8/10/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import UIKit
import Parse


class LogOutViewController: UIViewController {

    
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var logOutLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Programmatic UI changes
        self.view.backgroundColor = UIColor.blackColor()
        logOutButton.layer.cornerRadius = 10

    }
    
    
    @IBAction func logOutOfSwipeBack(sender: UIButton) {
        PFUser.logOutInBackground()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func returnToMyData(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    

}
