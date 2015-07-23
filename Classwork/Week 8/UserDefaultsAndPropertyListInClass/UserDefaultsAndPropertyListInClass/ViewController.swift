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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    @IBAction func segueAction(sender: UIButton) {
        
    }
}

