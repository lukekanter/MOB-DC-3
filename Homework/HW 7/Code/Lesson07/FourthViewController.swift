//
//  FourthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var fourthVCTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSTemporaryDirectory() + "path3.txt"
        var err: NSError?
        var savedStringOutput = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: &err)
        println(savedStringOutput)
        fourthVCTextView.text = savedStringOutput

    }
}
