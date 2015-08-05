//
//  StudentTableViewCell.swift
//  ParseStarterProject
//
//  Created by LOANER on 8/3/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class StudentTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
    
    var student: PFObject? {
        didSet {
            // Update name and location label
            nameLabel.text = student!["student_name"] as? String
            locationLabel.text = student!["student_location"] as? String
            
            // Check if parse has a value for the image column
            // If so it should be of type PFFile
            if let file = student!["image"] as? PFFile {
                // Load the image async
                file.getDataInBackgroundWithBlock({ (data, error) -> Void in
                    if error != nil {
                        println("could not get image data \(error?.localizedDescription)")
                        return
                    }
                    
                    // If we got to this point we're good as 
                    // if there would've been an error the return
                    // would've stopped executing
                    // We can fill out the image
                    self.userImage.image = UIImage(data: data!)
                })
            }
        }
    }

}
