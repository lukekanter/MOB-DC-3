//
//  FourthViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    // Hooking up the IB
    @IBOutlet weak var fibNumField: UITextField!
    @IBOutlet weak var fibNumLabel: UILabel!
    
    
    // Class to calculate fibonacci numbers
    class fibonacciAdder {
        // Declaring variables to track the last two numbers
        var n1 = 0
        var n2 = 0
        
        func fibonacciNumberAtIndex(indexOfFibonacciNumber: Int) -> Int {
            // Creates a list to return an index from later
            var fibList: [Int] = [0]
            // Loops through fibonnaci numbers and adds them to our list
            for i in 1...indexOfFibonacciNumber {
                // Fibonacci Logic
                switch(n1, n2) {
                case (0,0):
                    n2 = 1
                    fibList.append(n2)
                case (0,1):
                    n1 = 1
                    fibList.append(n2)
                default:
                    let result = n1 + n2
                    n1 = n2
                    n2 = result
                    fibList.append(result)
                }
            }
            // Returns the Nth Fibonacci number.
            return fibList[indexOfFibonacciNumber]
        }
    }

    
    // Creates an action for our calculate button
    @IBAction func calculateFibonacci(sender: UIButton) {
        // Creates an instance to initialize input values
        let fibInstance = fibonacciAdder()
        // Optional binds our input value
        if let num = fibNumField.text {
            // Grabs our input value. Shifts input value type for calculations.
            let fibnum = fibNumField.text.toInt()!
            // Changes label text to be the Nth Fibonacci number
            fibNumLabel.text = String(fibInstance.fibonacciNumberAtIndex(fibnum))
        }
    }
    /*
    BONUS TODO seven: Hook up the text input box, label and and a ‘calculate’ button. Create a ‘fibonacci adder’ class with a method ‘fibonacciNumberAtIndex' which takes indexOfFibonacciNumber (an integer).  When the button is pressed, create an instance of that class, call the method, and print out the appropriate fibonacci number of an inputted integer.
    The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number.
*/
}
