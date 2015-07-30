//
//  ThirdViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit
import Foundation



class ThirdViewController: UIViewController {

    
    @IBOutlet weak var thirdVCTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepareForSegue(segue: "thirdVCSegue", sender: UIBarButtonItem?) {
        let path = NSTemporaryDirectory() + "path.json"
        var err: NSError?
        
        if !NSFileManager.defaultManager().fileExistsAtPath(path) {
            NSFileManager.defaultManager().createDirectoryAtPath(path, withIntermediateDirectories: false, attributes: nil, error: &err)
            NSFileManager.defaultManager().createFileAtPath(path, contents: nil, attributes: nil)
            if NSFileManager.defaultManager().fileExistsAtPath(path) {
                println("works")
            }
        }
        
        var result = thirdVCTextView.text.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding, error: &err)
    }
    
    
    

}
