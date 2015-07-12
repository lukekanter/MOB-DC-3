//
//  MapViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit
import Foundation

class MapViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var keyField: UITextField!
    @IBOutlet weak var valueField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var dictionary = [String: String]()
    var keys = [String]()
    let cellID = "cellID"
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "changeToBlue", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "changeToRed", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyField.delegate = self
        valueField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    func changeToBlue() {
        keyField.backgroundColor = UIColor.blueColor()
        valueField.backgroundColor = UIColor.blueColor()
    }
    
    func changeToRed() {
        keyField.backgroundColor = UIColor.redColor()
        valueField.backgroundColor = UIColor.redColor()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == valueField {
            self.view.endEditing(true)
            dictionary[keyField.text] = valueField.text
            keys.append(keyField.text)
            tableView.reloadData()
            return true
        } else {
            return false
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionary.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellID") as! UITableViewCell
        if let myKey = dictionary[keys[indexPath.row]] {
            cell.textLabel?.text = "\(keys[indexPath.row]) \(myKey)"
        }
        return cell
    }
    
    override func viewDidDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    

        
        
        
        /*
        TODO three: Add TWO text views and a table view to this view controller, either using code or storyboard. Accept keyboard input from the two text views. When the 'return' button is pressed on the SECOND text view, add the text view data to a dictionary. The KEY in the dictionary should be the string in the first text view, the VALUE should be the second.
        TODO four: Make this class a UITableViewDelegate and UITableViewDataSource that supply this table view with cells that correspond to the values in the dictionary. Each cell should print out a unique pair of key/value that the map contains. When a new key/value is inserted, the table view should display it.
        TODO five: Make the background of the text boxes in this controller BLUE when the keyboard comes up, and RED when it goes down. Start with UIKeyboardWillShowNotification and NSNotificationCenter.
        */
    }

