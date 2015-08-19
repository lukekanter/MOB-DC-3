//
//  UsersTableViewController.swift
//  Parse-Relationships
//
//  Created by LOANER on 8/6/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit
import Parse

class UsersTableViewController: UITableViewController, AddUserDelegate {
    
    var users = [PFUser]()
    var currentUserIndexPath: NSIndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get all users from parse
        let query = PFUser.query()
        query!.findObjectsInBackgroundWithBlock { (users, error) -> Void in
            if error != nil {
                println("could not grab all users \(error)")
                return
            }
            
            println(users?.count)
            self.users = users as! [PFUser]
            self.tableView.reloadData()
        }
    }
    
    @IBAction func done(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addUser" {
            let destinationVC = segue.destinationViewController as! UINavigationController
            let addVC = destinationVC.topViewController as! AddUserTableViewController
            
            addVC.delegate = self
        }
    }
    
    func addUser(newUser: PFUser) {
        users.append(newUser)
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return users.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("userCell", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        let userForCell = users[indexPath.row]
        cell.textLabel?.text = userForCell.username
        cell.detailTextLabel?.text = userForCell.objectId
        
        if PFUser.currentUser()?.objectId == userForCell.objectId {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            currentUserIndexPath = indexPath
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let newUser = users[indexPath.row]
        println("new user username = \(newUser.username) and pass = \(newUser.password)")
        PFUser.logInWithUsernameInBackground(newUser.username!,
            password: "foo") { (newUser, error) -> Void in
                self.currentUserIndexPath = indexPath
                self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
                tableView.reloadData()
        }
    }

}
