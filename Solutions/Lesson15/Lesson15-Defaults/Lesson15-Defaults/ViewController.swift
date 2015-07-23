//
//  ViewController.swift
//  Lesson15-Defaults
//
//  Created by Arthur Sabintsev on 7/22/15.
//  Copyright (c) 2015 Arthur Ariel Sabintsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let counterID = "counterID"
    let defaults = NSUserDefaults.standardUserDefaults()
    
    var counter = 0 {
        willSet {
            println("Previous Value \(counter)")
        }
        
        didSet {
            println("New Value \(counter)")
            label.text = "\(counter)"
            
            defaults.setInteger(counter, forKey: counterID)
            defaults.synchronize()
        }
    }
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter = defaults.integerForKey(counterID)
    }
    
    @IBAction func buttonAction(sender: AnyObject) {
        counter++
    }
}

