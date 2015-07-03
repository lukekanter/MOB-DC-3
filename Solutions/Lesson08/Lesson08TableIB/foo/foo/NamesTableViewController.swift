//
//  NamesTableViewController.swift
//  foo
//
//  Created by Arthur Sabintsev on 6/29/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class NamesTableViewController: UITableViewController {
    
    var names = ["Thomas", "Arthur", "Devin", "Luke", "Foo"]

    override func viewDidLoad() {
        super.viewDidLoad()

        println("loaded")
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath) as! UITableViewCell
        
        /*
            NSIndexPath
                - Section
                - Row
        
            0, 0
            0, 1
            0, 2
            0, 3
        */

        // Configure the cell...
        println("Cell with row number = \(indexPath.row)")
        cell.textLabel?.text = names[indexPath.row]
        
        cell.backgroundColor = randomColor()

        return cell
    }
    
    func randomColor() -> UIColor{
        
        var randomRed:CGFloat = CGFloat(drand48())
        var randomGreen:CGFloat = CGFloat(drand48())
        var randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }



    
}
