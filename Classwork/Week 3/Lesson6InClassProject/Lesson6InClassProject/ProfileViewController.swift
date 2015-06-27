//
//  ProfileViewController.swift
//  Lesson6InClassProject
//
//  Created by Luke Kanter on 6/22/15.
//  Copyright (c) 2015 Luke Kanter. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController
{
    
    var name: String?
    var age: String?
    var sex: String?
    var location: String?
    
    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var ageField: UILabel!
    @IBOutlet weak var sexField: UILabel!
    @IBOutlet weak var locationField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        if let name = name {
            nameField.text = name
        }
        if let age = age {
            ageField.text = age
        }
        if let sex = sex {
            sexField.text = sex
        }
        if let location = location {
            locationField.text = location
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
