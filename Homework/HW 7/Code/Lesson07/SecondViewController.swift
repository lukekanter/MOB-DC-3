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
        var path = NSBundle.mainBundle().bundlePath
        var errorContents: NSError?
        let contents = NSFileManager.defaultManager().contentsOfDirectoryAtPath(path, error: &errorContents)
        let arrayOfContents = contents as! [NSString]
        for contentString in arrayOfContents {
            if contentString.containsString("Settings.bundle") {
                let swiftContentString = contentString as String
                path = path.stringByAppendingPathComponent(swiftContentString)
                path = path.stringByAppendingPathComponent("Root.plist")
                let settingsDict = NSDictionary(contentsOfFile: path)
                if let settingsDict = settingsDict {
                    settingsTextView.text = "\(settingsDict)"
                }
            }
        }
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
}
