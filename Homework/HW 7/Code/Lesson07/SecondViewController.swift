//
//  SecondViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit
import Foundation

class SecondViewController: UIViewController {

    @IBOutlet weak var settingsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let path = NSBundle.mainBundle().pathForResource("Root", ofType: ".plist")
        if let path = path {
            let settingsDict = NSDictionary(contentsOfFile: path)
            if let dict = settingsDict {
                let settingsName = dict.objectForKey("settings_name")
                let settingsSlider = dict.objectForKey("settings_slider")
                settingsTextView.text = "\(settingsName) \(settingsSlider)"
                println("works")
            }
        }
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
}
