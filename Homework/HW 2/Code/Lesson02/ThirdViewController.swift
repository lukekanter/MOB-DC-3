//
//  ThirdViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    // Hooking up the IB
    @IBOutlet weak var numField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    
    @IBAction func printButton(sender: UIButton) {
        // Optional binds the typed in number
        if let num = numField.text.toInt() {
            // Checks for divisibility by 2 and changes the label accordingly
            if num % 2 == 0 {
                outputLabel.text = "is even"
            } else {
                outputLabel.text = "is not even"
            }
        }
    }
    
    
    /*
    TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.

*/
}
