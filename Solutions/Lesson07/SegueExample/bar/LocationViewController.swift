//
//  LocationViewController.swift
//  bar
//
//  Created by Arthur Sabintsev on 6/24/15.
//  Copyright (c) 2015 Arthur Ariel Sabintsev. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    @IBOutlet weak var locationLabel: UILabel!
    
    var location: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let location = location {
            locationLabel.text = location
        }
    }

}
