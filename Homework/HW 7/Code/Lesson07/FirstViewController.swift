//
//  FirstViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var userDefaultsTextView: UITextView!
    let defaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let testString = defaults.stringForKey("test_string")
        let testNumber = defaults.integerForKey("test_number")
        if let testString = testString {
            userDefaultsTextView.text = testString + " \(testNumber)"
        }
    }
}