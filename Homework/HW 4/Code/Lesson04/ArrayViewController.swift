//
//  ViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ArrayViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
// hooking up the IB
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var tableView: UITableView!
// declares an array to store entered values
    var array = [String]()
// declares a cell ID to use to create a table view later
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
// sets delegates and registers the class
        field.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
// I'm not sure why we added this in class
//        self.dismissViewControllerAnimated(false, completion: nil)
        self.dismissViewControllerAnimated(false, completion: { () -> Void in
            self.view.backgroundColor = UIColor.blueColor()
        })
        self.view.backgroundColor = UIColor.redColor()
        
    }
// enables return for the text field
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        // appends entered value to the array
        array.append(self.field.text)
        tableView.reloadData()
        return true
    }
// sets up functions to align with UITableView protocols
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellID") as! UITableViewCell
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    
        
        /*
        TODO one: Add a table view AND a text input box to this view controller, either in code or via the storyboard. Accept keyboard input from the text view when the return key is pressed. Add the string that was entered into the text view into an array of strings (stored in this class).
        TODO two: Make this class a UITableViewDelegate and UITableViewDataSource that supply the above table view with cells. These cells should correspond to the text entered into the text box. E.g. If the text "one", then "two", then "three" was entered into the text box, there should be three cells in this table view that contain those strings in order.
        
        */
}

