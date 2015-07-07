//
//  ViewController.swift
//  Lesson03
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
//        let swipe = UISwipeGestureRecognizer(target: self, action: "gestureAction")
//        swipe.direction = .Right
//        label.addGestureRecognizer(swipe)
        
        let tap = UITapGestureRecognizer(target: self, action: "gestureAction")
        tap.numberOfTapsRequired = 3
//        label.addGestureRecognizer(tap)
//        label.userInteractionEnabled = true
        
        view.addGestureRecognizer(tap)
    }
    
    func gestureAction() {
        println("Gesture Performed")
        self.performSegueWithIdentifier("presentModal", sender: nil)
    }
    
    /*
    TODO one: Hook up a swipeable area on the home screen that must present a modal dialog when swiped. You must create the modal dialog and present it in CODE (not the storyboard).
    TODO two: Add an imageview to the modal dialog presented in TODO two.
    TODO three: Add and hook up a ‘dismiss’ button below the above mentioned image view that will dismiss the modal dialog. Do this in CODE.
    TODO four: Hook up the button on the home screen to push ArrayTableViewController into view (via the navigation controller) when tapped. Do this by triggering a segue from this view controller. The method you are looking for is performSegueWithIdentifier. Find the identifier from the storyboard.
    */

}

