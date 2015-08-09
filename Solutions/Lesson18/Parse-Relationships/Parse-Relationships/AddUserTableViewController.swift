//
//  AddUserTableViewController.swift
//  Parse-Relationships
//
//  Created by LOANER on 8/6/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit
import Parse

protocol AddUserDelegate {
    func addUser(newUser: PFUser)
}

class AddUserTableViewController: UITableViewController, UITextFieldDelegate {
    
    var delegate: AddUserDelegate?
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save(sender: UIBarButtonItem) {
        let newUser = PFUser()
        newUser.username = usernameField.text
        newUser.password = "foo"
        newUser.email = emailField.text
        
        newUser.signUpInBackgroundWithBlock { (success, error) -> Void in
            if error != nil {
                println("Could not save user = \(error?.localizedDescription)")
                return
            }
            
            self.delegate?.addUser(newUser)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Textfield delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == usernameField {
            usernameField.resignFirstResponder()
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            passwordField.resignFirstResponder()
            emailField.becomeFirstResponder()
        } else {
            emailField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        let usernameHasValue = usernameField.text != ""
        let emailHasValue = emailField.text != ""
        let passwordHasValue = passwordField != ""
        
        saveButton.enabled = usernameHasValue && emailHasValue && passwordHasValue
    }

    
}
