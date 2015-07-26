//
//  ProductsCollectionViewController.swift
//  CoreData
//
//  Created by LOANER on 7/25/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit
import CoreData

let reuseIdentifier = "productCell"

class ProductsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var articles = [Article]()
    var articleStore = ArticleStore.sharedStore
    var selectedIndexPath: NSIndexPath?

    @IBOutlet weak var cartBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load products from plist
        let path = NSBundle.mainBundle().pathForResource("Articles", ofType: "plist")
        if let path = path {
            let articles = NSArray(contentsOfFile: path)
            self.articles = articlesFromPlist(articles!)
        }
        
        // Load the top logo
        let logoImage = UIImage.RBResizeImage(UIImage(named: "logo")!, targetSize: CGSizeMake(50, 20))
        let logo = UIImageView(image: logoImage)
        logo.contentMode = UIViewContentMode.ScaleAspectFit
        self.navigationItem.titleView = logo
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        cartBarButton?.title = "Cart (\(articleStore.articlesInCart.count))"
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // If there is a selected cell
        if let selectedIndexPath = selectedIndexPath {
            collectionView?.deselectItemAtIndexPath(selectedIndexPath, animated: true)
            self.selectedIndexPath = nil
        }
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ProductCollectionViewCell
        
        cell.cellArticle = articles[indexPath.row]
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // Set the selected index path
        selectedIndexPath = indexPath
        
        // Perform the segue to the detail view
        self.performSegueWithIdentifier("showArticle", sender: self)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            let cellWidth = (collectionView.frame.width - 10) / 2
            return CGSizeMake(cellWidth, 180)
    }
    
    func articlesFromPlist(articleArray: NSArray) -> [Article] {
        // Create a tmp array of articles
        var tmpArticles = [Article]()
        
        // Loop over the articles in the array from the plist
        for article in articleArray {
            // Cast the currentArticle to a NSDictionary
            let currentArticle = article as! NSDictionary
            
            // Get the objects from the Dictionary
            let articleName = currentArticle.objectForKey("name") as! String
            let articleDescr = currentArticle.objectForKey("description") as! String
            let articlePrice = currentArticle.objectForKey("price") as! Double
            let articleNumber = currentArticle.objectForKey("number") as! String
            let articleImage = currentArticle.objectForKey("image") as! String
            
            // Create a new article from the Article struct
            let newArticle = Article(name: articleName, description: articleDescr,
                price: articlePrice, number: articleNumber, image: articleImage)
            
            // Append it to the temporary array
            tmpArticles.append(newArticle)
        }
        
        // Return the tmp array
        return tmpArticles
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showArticle" {
            let selectedProduct = articles[selectedIndexPath!.row]
            let destinationVC = segue.destinationViewController as! ProductDetailViewController
            
            // Set the destination VC's product
            destinationVC.article = selectedProduct
        }
    }

}
