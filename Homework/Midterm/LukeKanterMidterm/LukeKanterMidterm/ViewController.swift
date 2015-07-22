//
//  ViewController.swift
//  LukeKanterMidterm
//
//  Created by Luke Kanter on 7/15/15.
//  Copyright (c) 2015 Luke Kanter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
// hooking up IB
    @IBOutlet weak var displayField: UILabel!
    @IBOutlet weak var allClearButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var decimalPointButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var equalsButton: UIButton!
    // create variables: first operand
    var firstOperand = Double?()
    // second operand
    var secondOperand = Double?()
    // answer that we'll return
    var result = Double?()
    // boolean that let's us determine which boolean we're typing
    var onSecondOperand = false
    // stores display value
    var display = "0"
    // let's the equals function determine which operation to perform
    var operation = String()
    
    
    
    
    @IBOutlet weak var button1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // add subviews to iterate through
        view.addSubview(allClearButton)
        view.addSubview(clearButton)
        view.addSubview(percentButton)
        view.addSubview(decimalPointButton)
        view.addSubview(zeroButton)
        view.addSubview(oneButton)
        view.addSubview(twoButton)
        view.addSubview(threeButton)
        view.addSubview(fourButton)
        view.addSubview(fiveButton)
        view.addSubview(sixButton)
        view.addSubview(sevenButton)
        view.addSubview(eightButton)
        view.addSubview(nineButton)
        view.addSubview(divideButton)
        view.addSubview(multiplyButton)
        view.addSubview(subtractButton)
        view.addSubview(addButton)
        view.addSubview(equalsButton)
        // iterate through subviews
        for v in view.subviews {
            // sort out views that don't need a border
            if (v is UIButton) {
                // cast button to type UIButton
                let button = v as! UIButton
                // create border properties
                button.layer.borderColor = UIColor.blackColor().CGColor
                button.layer.borderWidth = 1.0
            }
        }
        // set intial display value
        displayField.text = display
    }
    // function that allow the number buttons to type into the display
    @IBAction func number(sender: UIButton) {
        // gets rid of leading zero
        if display == "0" {
            display = ""
        }
        // determines which character to type
        switch sender {
        case zeroButton:
            display.append("0" as Character)
        case oneButton:
            display.append("1" as Character)
        case twoButton:
            display.append("2" as Character)
        case threeButton:
            display.append("3" as Character)
        case fourButton:
            display.append("4" as Character)
        case fiveButton:
            display.append("5" as Character)
        case sixButton:
            display.append("6" as Character)
        case sevenButton:
            display.append("7" as Character)
        case eightButton:
            display.append("8" as Character)
        case nineButton:
            display.append("9" as Character)
        case decimalPointButton:
            display.append("." as Character)
        default:
            display = ""
        }
        // reloads displayField's value
        displayField.text = display
    }
    // function for allClearButton
    @IBAction func allClearAction(sender: UIButton) {
        // rests all variables to their inital values
        onSecondOperand = false
        firstOperand = nil
        secondOperand = nil
        result = nil
        operation = ""
        // resets displayField
        display = "0"
        displayField.text = display
    }
    @IBAction func clearAction(sender: UIButton) {
        //resets displayField only
        display = "0"
        displayField.text = display
    }

    // stores the first operand, sets the type of operation, and starts typing the second operand
    @IBAction func operatorAction(sender: UIButton) {
        // performs the equals function if a prior function has been performed
        if onSecondOperand == true {
            displayEquals()
        }
        // if no prior function has been performed
        if onSecondOperand == false {
            // cast to type NSString in order to access doubleValue method
            let newString = display as! NSString
            // change string to type double
            firstOperand = newString.doubleValue
            // sets the number function to type the second operand into the display
            onSecondOperand = true
        }
        // sets the type of operation
        switch sender {
        case divideButton:
            operation = "division"
        case multiplyButton:
            operation = "multiplication"
        case subtractButton:
            operation = "subtraction"
        case addButton:
            operation = "addition"
        default:
            operation = ""
        }
        // resets display value
        display = ""
        // NOTE: does NOT change the value display in the UITextField until a new number is typed
    }
    // function for percentButton
    @IBAction func percentAction(sender: UIButton) {
        // casts the value of whatever has been typed to an NSString in order to access doubleValue method
        let newString = displayField.text! as! NSString
        // perfrom doubleValue method
        var newValue = newString.doubleValue
        // math to create a percent, also sets it back to a type string
        display = "\(newValue * 100)%"
        // reloads displayField's value
        displayField.text = display
    }
    // function for equalsButton
    @IBAction func equalsAction(sender: UIButton) {
        // accesses other method. The method is declared separately so it can also be accessed by the operator function
        displayEquals()
    }
    
    func displayEquals() {
        // prevents the button from working without tapping an operator or if it is the last key pressed
        if onSecondOperand == true && display != "" {
            // casts display value to type NSString to access doubleValue method
            let newString = display as! NSString
            // perform doubleValue method
            secondOperand = newString.doubleValue
            // performs different functions based on which button is tapped
            switch operation {
            case "division":
                if secondOperand != 0 {
                    result = firstOperand! / secondOperand!
                } else {
                    display = "undefined"
                }
            case "multiplication":
                result = firstOperand! * secondOperand!
            case "subtraction":
                result = firstOperand! - secondOperand!
            case "addition":
                result = firstOperand! + secondOperand!
            // this code is a placeholder. It will never run because the operation is set directly after onSecondOperand is set to true
            default:
                result = secondOperand
            }
            // optional binds result because its of type Optional
            if let result = result {
                // sets display value to the answer and converts it to type String
                display = "\(result)"
            }
            // reloads displayField's value
            displayField.text = display
            // sets first operand to the answer to perform subsequent operations on it
            firstOperand = result
            // resets the values that weren't set before the function was performed
            secondOperand = nil
            result = nil
            operation = ""
            // resets display value
            display = ""
        }
    }
    

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

