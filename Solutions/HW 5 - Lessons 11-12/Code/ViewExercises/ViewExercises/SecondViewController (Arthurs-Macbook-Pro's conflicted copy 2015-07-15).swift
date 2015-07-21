//
//  SecondViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class SecondViewController: ExerciseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 2"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Build four blue squares, 20 points wide, one in each corner of the screen. 
        They must stay in their respective corners on device rotation. 
        
        Use Autolayout.
        
        Your view should be in self.exerciseView, not self.view
        */
        
        let square1 = UIView()
        square1.setTranslatesAutoresizingMaskIntoConstraints(false)
        square1.backgroundColor = UIColor.blueColor()
        self.exerciseView.addSubview(square1)
        let views = ["square1": square1]
        
        let square1ArrayConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|[square1(20)]",
            options: NSLayoutFormatOptions.AlignAllBaseline,
            metrics: nil,
            views: views)
        self.exerciseView.addConstraints(square1ArrayConstraints)
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    func next() {
        self.performSegueWithIdentifier("three", sender: nil)
    }
}
