//
//  ViewController.swift
//  Lesson12-AutoLayout-IB
//
//  Created by Arthur Sabintsev on 7/13/15.
//  Copyright (c) 2015 Arthur Ariel Sabintsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let errorLabel = UILabel()
        errorLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        errorLabel.text = "We could not find your email address"
        errorLabel.textColor = UIColor.redColor()
        errorLabel.backgroundColor = UIColor.yellowColor()
        errorLabel.numberOfLines = 0
        view.addSubview(errorLabel)
        
        errorLabel.text = "fsdj aksdlf jasklf jasdklf jasdfkl jafdl kjasdf klasdjfkl asjdf klafd; sdafajsd klfasd; a"
        
        let leftConstraint = NSLayoutConstraint(item: errorLabel,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: emailField,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1.0, constant: 0)
        
        let topConstraint = NSLayoutConstraint(item: errorLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: emailField,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0, constant: 10)
        
        let rightConstraint = NSLayoutConstraint(item: errorLabel,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: emailField,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1.0, constant: 0)
        
        leftConstraint.active = true
        topConstraint.active = true
        rightConstraint.active = true
        
//        view.addConstraint(leftConstraint)
//        view.addConstraint(topConstraint)
//        
//        view.addConstraints([leftConstraint, topConstraint])
        
    }
}

