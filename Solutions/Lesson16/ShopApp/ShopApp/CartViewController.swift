//
//  CartViewController.swift
//  ShopApp
//
//  Created by LOANER on 7/25/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

let priceAscendingDefaultsKey = "priceAscending"

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var articleStore = ArticleStore.sharedStore
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get rid of the default blue on the back button
        navigationController?.navigationBar.tintColor = UIColor.vineyardBlue()
        
        // Load the top logo
        let logoImage = UIImage.RBResizeImage(UIImage(named: "logo")!, targetSize: CGSizeMake(50, 20))
        let logo = UIImageView(image: logoImage)
        logo.contentMode = UIViewContentMode.ScaleAspectFit
        self.navigationItem.titleView = logo
        
        // Allow editing on tableview
        tableView.allowsMultipleSelectionDuringEditing = false
        
        // Get the current way of sorting
        let currentSorting = defaults.boolForKey(priceAscendingDefaultsKey)
        
        // Update the button
        sortButton.title = currentSorting ? "Price ▴" : "Price ▾"
    }
    
    @IBAction func dismiss(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func changeSorting(sender: UIBarButtonItem) {
        // Get the current way of sorting
        let currentSorting = defaults.boolForKey(priceAscendingDefaultsKey)
        
        // Store the new inverted way in to the defaults
        defaults.setBool(!currentSorting, forKey: priceAscendingDefaultsKey)
        
        // Update the array
        articleStore.articlesInCart = articleStore.getAllCartItems(cheapestFirst: !currentSorting)
        
        // Reload the tableView
        tableView.reloadData()
        
        // Update the button
        sortButton.title = !currentSorting ? "Price ▴" : "Price ▾"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleStore.articlesInCart.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cartCell", forIndexPath: indexPath) as! CartItemTableViewCell
        
        cell.cartItem = articleStore.articlesInCart[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            articleStore.deleteCartItemAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

}
