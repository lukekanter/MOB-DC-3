//
//  ViewController.swift
//  OptionalExample
//
//  Created by Arthur Sabintsev on 6/15/15.
//  Copyright (c) 2015 Arthur Ariel Sabintsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var age: Int? // = nil
        if let age = age {
            println("age: \(age)")
        } else {
            age = 100
        }

    }

}

