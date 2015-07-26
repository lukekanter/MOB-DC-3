//
//  MediaTableViewController.swift
//  UserDefaultsAndPropertyListInClass
//
//  Created by Luke Kanter on 7/22/15.
//  Copyright (c) 2015 Luke Kanter. All rights reserved.
//

import UIKit
import Foundation

class MediaTableViewController: UITableViewController {


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
        }
        
        
    }
    
     func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let defaults = NSUserDefaults.standardUserDefaults()
        if  section == 1 {
            return "Movies"
        }
        if section == 2 {
            return "Songs"
        } else {
            return ""
        }
    }

     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let movieList =  NSUserDefaults.standardUserDefaults().arrayForKey("movieList")
        let songList = NSBundle.mainBundle().pathForResource("SongsPList", ofType: ".plist")
        let songListArray = NSArray(contentsOfFile: "SongsPList")
        let songsListArray = songListArray as! [String]
        var numOfSections = Int()
        if let movies = movieList {
            if section == 1 {
                numOfSections = movies.count
            }
            else if section == 2 {
                numOfSections = songsListArray.count
            }
            else {
                numOfSections = 0
            }
        }
        return numOfSections
    }


     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellID", forIndexPath: indexPath) as! UITableViewCell
        var movieList = ["String"]
        if let movies = NSUserDefaults.standardUserDefaults().arrayForKey("movieList") {
            movieList = movies as! [String]
        }
        var row = indexPath.row
        println("movieList")
        cell.textLabel!.text = movieList[row]
        return cell
    }

   

   

   

   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */


