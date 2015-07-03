//
//  FirstTableViewController.swift
//  Tables
//
//  Created by Arthur Sabintsev on 7/1/15.
//  Copyright (c) 2015 Arthur Ariel Sabintsev. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {

    let cellID = "kjasfhkjshfd"
    var names: [String]!
    var companies: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellID)
        names = ["Kris", "Rashod", "Roy", "Dylan"]
        companies = ["Apple", "Microsoft", "Google"]
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let rows = (section == 0) ? names.count : companies.count
        
        return rows
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (section == 0) ? "names" : "companies"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! UITableViewCell
        
            cell.textLabel?.text =
                (indexPath.section == 0) ? names[indexPath.row] : companies[indexPath.row]

        return cell
    }

}
