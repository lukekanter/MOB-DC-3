//
//  SignUpViewController.swift
//  Koloda
//
//  Created by Luke Kanter on 8/19/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var returnToLoginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Programmatic changes to UI
        self.view.backgroundColor = UIColor.blackColor()
        signUpButton.layer.cornerRadius = 10
        returnToLoginButton.layer.cornerRadius = 10
    }

    @IBAction func signUpWithSwipeBack(sender: UIButton) {
        var user = PFUser()
        // Save text field content to new Parse user
        user.username = emailField.text
        user.password = passwordField.text
        user.email = emailField.text
        // Create new parse user
        user.signUpInBackgroundWithBlock { (succeeded, error) -> Void in
            if let error = error {
                let errorString = error.userInfo?["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
                
            } else {
                // Set initial values for reporting data
                user["profileLikes"] = 0
                user["bodyLikes"] = 0
                user["faceLikes"] = 0
                user["finalLikes"] = 0
                user["profilePasses"] = 0
                user["bodyPasses"] = 0
                user["facePasses"] = 0
                user["finalPasses"] = 0
                // Save changes to Parse
                user.saveInBackground()
                // Dissmiss the sign up view controller
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
    
    @IBAction func returnToLoginScreen(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
