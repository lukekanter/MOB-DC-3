//
//  ViewController.swift
//  bar
//
//  Created by Arthur Sabintsev on 6/24/15.
//  Copyright (c) 2015 Arthur Ariel Sabintsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!

    /* 
        Order Of Operations to Pass Data
        
        1. Dragging a segue in your storyboard (from a button to another screen)
        2. Give segue Identifier in identity inspector (make sure your segue is highlighted)
        3. Have the prepareForSegue method in the VC where you have access to the intial data
        4. Call super.prepareForSegue
        5. Optional Bind the identifier property
        6. Get the destinationViewController and cast it to your custom class (as! MyVC)
        7. Set properties on destinationViewController
        8. In viewDidLoad in destinationViewController do something with your data (this is an optional task)
    */
    
    override func viewDidLoad() {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
        if let identifier = segue.identifier {
            if identifier == "showLocation" {
                let locationVC = segue.destinationViewController as! LocationViewController
                locationVC.location = locationTextField.text
            } else if identifier == "showName" {
                let nameVC = segue.destinationViewController as! NameViewController
                nameVC.name = nameTextField.text
            }
        }
    }
    

}

