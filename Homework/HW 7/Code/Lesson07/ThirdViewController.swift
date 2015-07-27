//
//  ThirdViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    
    @IBOutlet weak var thirdVCTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSTemporaryDirectory() + "advanced.json"
        if !NSFileManager.fileExistsAtPath(path) {
            var err: NSError?
            NSFileManager.createDirectoryAtPath(path)
        }

       
    }
    @IBAction func writeTextToFlatFile(sender: UIBarButtonItem) {
        
        
        
    }
}
