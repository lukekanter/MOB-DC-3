//
//  MoviesTableViewController.swift
//  Movies
//
//  Created by LOANER on 7/22/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    var moviesFromPlist = [String]()
    var moviesFromDefaults = [String]()
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch from user defaults
        let fetchFromDefaults: AnyObject! = defaults.arrayForKey("movies")
        if let fetchFromDefaults = fetchFromDefaults as? [String] {
            moviesFromDefaults = fetchFromDefaults
        }
        
        // Fetch from plist
        if let path = NSBundle.mainBundle().pathForResource("Movies", ofType: "plist") {
            let fetchFromPlist = NSArray(contentsOfFile: path)
            moviesFromPlist = fetchFromPlist as! [String]
        }
        
        
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? moviesFromDefaults.count : moviesFromPlist.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Defaults" : "Plist"
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell",
                    forIndexPath: indexPath) as! UITableViewCell
        
        let sourceArray = indexPath.section == 0 ? moviesFromDefaults : moviesFromPlist
        let movieName = sourceArray[indexPath.row]
        
//        if indexPath.section == 0 {
//            cell.textLabel?.text = moviesFromDefaults[indexPath.row]
//        } else {
//            cell.textLabel?.text = moviesFromPlist[indexPath.row]
//        }
        
        cell.textLabel?.text = movieName

        return cell
    }


}
