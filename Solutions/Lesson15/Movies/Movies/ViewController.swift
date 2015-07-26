//
//  ViewController.swift
//  Movies
//
//  Created by LOANER on 7/22/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var movieField: UITextField!
    @IBOutlet weak var countLabel: UILabel!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    var movies = [String]() {
        didSet {
            let count = movies.count
            countLabel.text = count == 1 ? "1 movie" : "\(movies.count) movies"
        }
    }

    override func viewWillAppear(animated: Bool) {
        // Reset the movies array to be empty again
        movies = [String]()
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.text != "" {
            movies.append(textField.text)
        }
        
        textField.text = ""
        
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "movieList" {
            defaults.setObject(movies, forKey: "movies")
        }
    }

}

