//
//  ViewController.swift
//  LukeKanterMidterm
//
//  Created by Luke Kanter on 7/15/15.
//  Copyright (c) 2015 Luke Kanter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    var firstOperand = Double?()
    var secondOperand = Double?()
    var result = Double?()
    var onSecondOperand = false
    var display = "0"
    var operation = String()
    
    
    
    
    @IBOutlet weak var button1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        for v in view.subviews {
            if (v is UIButton) {
                let button = v as! UIButton
                button.layer.borderColor = UIColor.blackColor().CGColor
                button.layer.borderWidth = 1.0
            }
        }
        
        displayField.text = display
    }
    
    @IBAction func number(sender: UIButton) {
        if display == "0" {
            display = ""
        }
        
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
        displayField.text = display
    }

    @IBAction func allClearAction(sender: UIButton) {
        onSecondOperand = false
        firstOperand = nil
        secondOperand = nil
        result = nil
        operation = ""
        display = "0"
        displayField.text = display
    }
    @IBAction func clearAction(sender: UIButton) {
        display = "0"
        displayField.text = display
    }

    
    @IBAction func operatorAction(sender: UIButton) {
        if onSecondOperand == true {
            displayEquals()
        }
        if onSecondOperand == false {
            let newString = display as! NSString
            firstOperand = newString.doubleValue
            onSecondOperand = true
        }
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
        display = ""
    }
    @IBAction func percentAction(sender: UIButton) {
        let newString = displayField.text! as! NSString
        var newValue = newString.doubleValue
        display = "\(newValue * 100)%"
        displayField.text = display
    }
    
    @IBAction func equalsAction(sender: UIButton) {
        displayEquals()
    }
    
    func displayEquals() {
        if onSecondOperand == true && display != "" {
            let newString = display as! NSString
            secondOperand = newString.doubleValue
        
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
            default:
                result = secondOperand
            }
            if let result = result {
                display = "\(result)"
            }
            displayField.text = display
            firstOperand = result
            secondOperand = nil
            result = nil
            display = ""
            operation = ""
        }
    }
    

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

