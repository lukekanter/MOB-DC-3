//
//  FirstViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    // Linking up the IB views
    @IBOutlet weak var helloWorldLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    // Change label text to Hello World
    @IBAction func printHelloWorld(sender: UIButton) {
        helloWorldLabel.text = "Hello, World!"
    }
    // Print name and age declaration to the console
    @IBAction func printNameAndAge(sender: UIButton) {
        println("Hello \(nameField.text), you are \(ageField.text) years old!")
    }
    // Prints your age-based priveleges to the console
    @IBAction func drinkVoteDrive(sender: UIButton) {
        // Age checking logic
        if ageField.text.toInt() >= 21 {
            println("You can drink")
        } 
        if ageField.text.toInt() >= 18 {
            println("You can vote")
        }
        if ageField.text.toInt() >= 16 {
            println("You can drive")
        }
    }
    // Does the same thing as the function above but more concisely
    @IBAction func exclusiveDrinkVoteDrive(sender: UIButton) {
        // Age checking logic with two conditions
        if ageField.text.toInt() >= 21 {
            println("You can drive, vote, and drink (but not at the same time!)")
        } else if ageField.text.toInt() >= 18 && ageField.text.toInt() < 21 {
            println("You can drive and vote")
        } else if ageField.text.toInt() >= 16 && ageField.text.toInt() < 18 {
            println("You can drive")
        }
    }

    
    /*
    TODO one: hook up a button in interface builder to a new function (to be written) in this class. Also hook up the label to this class. When the button is clicked, the function to be written must make a label say ‘hello world!’
    
    TODO two: Connect the ‘name’ and ‘age’ text boxes to this class. Hook up the button to a NEW function (in addition to the function previously defined). That function must look at the string entered in the text box and print out “Hello {name}, you are {age} years old!”
    TODO three: Hook up the button to a NEW function (in addition to the two above). Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”
    TODO four: Hook up the button to a NEW function (in additino to the three above). Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
    */
}