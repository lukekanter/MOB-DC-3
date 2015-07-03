//
//  TableViewController.swift
//  
//
//  Created by Arthur Sabintsev on 6/29/15.
//
//

import UIKit

class TableViewController: UITableViewController {

    let identifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: identifier)
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        let rows: Int
//        
//        switch section {
//            case 0:
//                rows = 1
//            case 1:
//                rows = 2
//            default:
//                rows = 0
//        }
        
        return 2
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! UITableViewCell

        if indexPath.row == 0 {
            cell.textLabel?.text = "Arthur"
        } else {
            cell.textLabel?.text = "Thomas"
        }

        return cell
    }
    

}
