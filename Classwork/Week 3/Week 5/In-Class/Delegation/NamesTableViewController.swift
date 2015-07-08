//
//  NamesTableViewController.swift
//  Delegation
//
//  Created by Thomas Degry on 6/29/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class NamesTableViewController: UITableViewController, AddStudentDelegate {
    
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showAddStudents" {
            let destinationVC = segue.destinationViewController as! AddViewController
            destinationVC.delegate = self
        }
    }
    
    func addStudent(name: String) {
        names.append(name)
        tableView.reloadData()
    }

}
