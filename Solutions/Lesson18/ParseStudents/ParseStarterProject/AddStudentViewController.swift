//
//  AddStudentViewController.swift
//  ParseStarterProject
//
//  Created by LOANER on 8/3/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

protocol AddStudentDelegate {
    func addStudent(name: String, location: String, image: UIImage?)
}

class AddStudentViewController: UIViewController {
    
    var delegate: AddStudentDelegate?

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func save(sender: UIBarButtonItem) {
        delegate?.addStudent(nameField.text, location: locationField.text, image: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
