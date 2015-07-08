//
//  ViewController.swift
//  Delegation-basics
//
//  Created by LOANER on 7/6/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CountUpDelegate {
    
    var counter = 0
    @IBOutlet weak var countLabel: UILabel!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showCountUp" {
            let destinationVC = segue.destinationViewController as! CountUpViewController
            destinationVC.delegate = self
            destinationVC.time = "foo"
        }
    }

    func addOneToLabel() {
        counter++
        countLabel.text = "\(counter)"
    }

}

