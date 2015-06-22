//
//  ViewController.swift
//  Lesson 5 Code Along
//
//  Created by LOANER on 6/17/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var factButton: UIButton!
    @IBOutlet weak var starButton: UIButton!
    
    var factBook = Factbook()
    var colorWheel = Colorwheel()
    var favoriteFact: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateFact(factButton)
    }

    @IBAction func generateFact(sender: UIButton) {
        let newFact = factBook.randomFact()
        factLabel.text = newFact
        
        let randomColor = colorWheel.randomColor()
        view.backgroundColor = randomColor
        
        factButton.setTitleColor(randomColor, forState: UIControlState.Normal)
    }
}

