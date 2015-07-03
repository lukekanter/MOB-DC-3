//
//  ViewController.swift
//  Dict
//
//  Created by Arthur Sabintsev on 7/1/15.
//  Copyright (c) 2015 Arthur Ariel Sabintsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var names: [String: String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        names = ["Luke": "K", "Handy": "D", "Devin": "C"]
        names["Luke"] = "Black"
        names["Kevin"] = "Park"
        names.removeValueForKey("Handy")
        swapTwoKeys("Kris", oldKey: names.keys.array[0])
        
    }
    
    func swapTwoKeys(newKey: String, oldKey: String) {
        names[newKey] = names[oldKey]
        names.removeValueForKey(oldKey)
        
        println(names)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

