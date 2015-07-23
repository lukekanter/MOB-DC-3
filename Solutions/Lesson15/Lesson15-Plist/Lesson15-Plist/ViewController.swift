//
//  ViewController.swift
//  Lesson15-Plist
//
//  Created by Arthur Sabintsev on 7/22/15.
//  Copyright (c) 2015 Arthur Ariel Sabintsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let studentsPath = NSBundle.mainBundle().pathForResource("Students", ofType: "plist")
        
        if let studentsPath = studentsPath {
            let students = NSArray(contentsOfFile: studentsPath)
            println(students)
        }
        
        let instructorsPath = NSBundle.mainBundle().pathForResource("Instructors", ofType: "plist")
        
        if let instructorsPath = instructorsPath {
            let instructors = NSDictionary(contentsOfFile: instructorsPath)
            println(instructors)
        }
        
    }

}

