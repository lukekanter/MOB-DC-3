//
//  NamesTableViewController.swift
//  Delegation
//
//  Created by Thomas Degry on 6/29/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class NamesTableViewController: UITableViewController, StudentDelegate {
    
    // Keep track of all names in this array
    var names = [String]()

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("namecell", forIndexPath: indexPath) as! UITableViewCell
        
        // Fill out the user textLabel of the row by grabbing the student's name
        let studentName = names[indexPath.row]
        cell.textLabel?.text = studentName

        return cell
    }
    
    // Implement the addStudentWithName method from the Student Delegate
    func addStudentWithName(studentName: String) {
        // Append the new name to the array of names
        names.append(studentName)
        
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Make sure we are only doing this for the addStudent segue
        // In case we create another segue later on
        if segue.identifier == "addStudent" {
            // Cast the destination viewController to a AddViewController
            // Otherwise we wouldn't have access to the delegate property defined in AddViewController
            let destinationVC = segue.destinationViewController as! AddViewController
            
            // Assign the NamesTableViewController as the delegate of the AddViewController
            // What basically means, I'll listen to the methods you want me to implement
            destinationVC.delegate = self
        }
    }

}
