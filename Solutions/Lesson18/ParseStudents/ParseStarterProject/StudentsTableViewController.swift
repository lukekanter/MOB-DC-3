//
//  StudentsTableViewController.swift
//  ParseStarterProject
//
//  Created by LOANER on 8/3/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class StudentsTableViewController: UITableViewController, AddStudentDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Array with all the students
    var students = [PFObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Force the controller to reload on viewDidLoad
        // and go to Parse.com
        refreshTable(UIRefreshControl())
    }
    
    @IBAction func selectPhoto(sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            imagePicker.delegate = self
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    // MARK: - UIImagePickerDelegate methods
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingImage image: UIImage!,
        editingInfo: [NSObject : AnyObject]!) {
            
            // Dismiss the view controller and on dismissal
            // get the picture
            self.dismissViewControllerAnimated(true, completion: { () -> Void in
                // Let's be smart and use our delegate method
                // Note: Updated the method from in class
                self.addStudent("foo", location: "bar", image: image)
            })
            
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addStudent" {
            // Get the destination VC (of type UINavigationController
            let destinationVC = segue.destinationViewController as! UINavigationController
            
            // Get a reference to the addStudentVC using topViewController
            let addVC = destinationVC.topViewController as! AddStudentViewController
            
            // Set ourselves as delegate
            addVC.delegate = self
        }
    }
    
    func addStudent(name: String, location: String, image: UIImage?) {
        // Create a new Student PFObject
        let newStudent = PFObject(className: "Student")
        newStudent["student_name"] = name
        newStudent["student_location"] = location
        
        // If there is an image
        if let image = image {
            // Convert UIImage to NSData & PfImage
            let imageData = UIImagePNGRepresentation(image)
            let parseImage = PFFile(name: "photo", data: imageData)
            
            newStudent["image"] = parseImage
        }
        
        newStudent.saveInBackgroundWithBlock { (success, error) -> Void in
            if error != nil {
                println("Could not save object with error \(error?.localizedDescription)")
                return
            }
            
            println("Saved student in background")
            
            // Append to the array
            self.students.append(newStudent)
            
            // Reload the tableView
            self.tableView.reloadData()
        }
    }
    
    @IBAction func refreshTable(sender: UIRefreshControl) {
        // Instantiate a PFQuery
        let query = PFQuery(className: "Student")
        
        // Sorting
        query.orderByDescending("updatedAt")
        
        // If you want to look for a name/id
        // query.whereKey("student_name", containsString: "ho")
        
        query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
            if error != nil {
                println("could not grab students from parse")
                return
            }
            
            // Set self.students equal to the parse array
            self.students = results as! [PFObject]
            
            // Tell the refresh control to stop spinning
            sender.endRefreshing()
            
            // Reload the tableView
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("studentCell", forIndexPath: indexPath) as! StudentTableViewCell

        let currentStudent = students[indexPath.row] // PFObject
        cell.student = currentStudent
        
        return cell
    }

}
