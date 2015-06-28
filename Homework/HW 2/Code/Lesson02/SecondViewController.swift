//
//  SecondViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
   
    // Hooking up the IB
    @IBOutlet weak var numField: UITextField!
    @IBOutlet weak var sumLabel: UILabel!
    
    // Sets a variable to track our sum
    var runningTotal = 0
    
    // Adds the typed in button to the sum and changes the label text to match it
    @IBAction func addButton(sender: UIButton) {
        // Optional binds the input value
        if let numField = numField.text {
            // Adds our input value
            runningTotal = runningTotal + numField.toInt()!
            // Changes our label to the new sum
            sumLabel.text = String(runningTotal)
        }
        
    }
    
    //TODO five: Display the cumulative sum of all numbers added every time the ‘add’ button is pressed. Hook up the label, text box and button to make this work.
}
