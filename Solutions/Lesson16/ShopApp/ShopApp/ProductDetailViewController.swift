//
//  ProductDetailViewController.swift
//  ShopApp
//
//  Created by LOANER on 7/25/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit
import CoreData

class ProductDetailViewController: UIViewController {
    
    var article: Article?
    var isInCart = false {
        didSet {
            // Update the button background color
            let bgImage = isInCart ? UIImage.imageWithColor(UIColor(red:0, green:0.106, blue:0.267, alpha:1)) :
                UIImage.imageWithColor(UIColor(red:0.961, green:0.635, blue:0.714, alpha:1))
            cartButton.setBackgroundImage(bgImage, forState: .Normal)
        }
    }
    var articleStore = ArticleStore.sharedStore
    var cartBarButton: UIBarButtonItem?
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleName: UILabel!
    @IBOutlet weak var articleNumber: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    @IBOutlet weak var articlePrice: UILabel!
    @IBOutlet weak var cartButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Give the add to cart button some rounded corners
        cartButton.layer.cornerRadius = 3
        
        // Get rid of the default blue on the back button
        navigationController?.navigationBar.tintColor = UIColor.vineyardBlue()
        
        self.articleImage.image = UIImage.RBResizeImage(UIImage(named: article!.image)!,
            targetSize: CGSizeMake(articleImage.frame.width, 400))
        self.articleName.text = article?.name
        self.articleNumber.text = article?.number
        self.articleDescription.text = article?.description
        self.articlePrice.text = "$\(article!.price)"
        
        // Add a barbutton item
        cartBarButton = UIBarButtonItem(title: "Cart", style: .Plain, target: self, action: "showCart")
        self.navigationItem.rightBarButtonItem = cartBarButton!
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Check if the article is already in the cart
        isInCart = articleStore.articleIsInCart(article!)
        
        // Update bar button title
        cartBarButton?.title = "Cart (\(articleStore.articlesInCart.count))"
    }

    @IBAction func toggleCart(sender: UIButton) {
        if isInCart {
            // We need to remove the article
            articleStore.deleteArticleFromCart(article!)
        } else {
            // We need to add the article
            articleStore.addItemToCart(article!)
        }
        
        // Inverse is in cart flag
        isInCart = !isInCart
        
        // Update bar button title
        cartBarButton?.title = "Cart (\(articleStore.articlesInCart.count))"
    }
    
    func showCart() {
        self.performSegueWithIdentifier("showCart", sender: nil)
    }
}
