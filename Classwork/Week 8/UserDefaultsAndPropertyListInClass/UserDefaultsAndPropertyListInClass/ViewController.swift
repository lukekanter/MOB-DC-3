//
//  ViewController.swift
//  UserDefaultsAndPropertyListInClass
//
//  Created by Luke Kanter on 7/22/15.
//  Copyright (c) 2015 Luke Kanter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var segueButton: UIButton!
    var movieList = [String]()
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        movieList.append(inputField.text)
        inputField.text = ""
        return true
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        defaults.arrayForKey("movieList")
    }
        
    
}

