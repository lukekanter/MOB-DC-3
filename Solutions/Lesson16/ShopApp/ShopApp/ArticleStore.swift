//
//  ArticleStore.swift
//  ShopApp
//
//  Created by LOANER on 7/25/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit
import CoreData

class ArticleStore {
    static let sharedStore = ArticleStore()
    
    private var context: NSManagedObjectContext
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    var articlesInCart = [CartItem]()
    
    init() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        context = appDelegate.managedObjectContext!
        
        // Get the prefered display order
        let currentSorting = defaults.boolForKey(priceAscendingDefaultsKey)
        
        // Get all the products in the cart
        articlesInCart = getAllCartItems(cheapestFirst: currentSorting)
    }
    
    func getAllCartItems(#cheapestFirst: Bool) -> [CartItem] {
        // Create a sort sortDescritpor on itemPrice
        let priceSort = NSSortDescriptor(key: "itemPrice", ascending: cheapestFirst)
        
        // Create a fetch request
        let fetchRequest = NSFetchRequest(entityName: "CartItem")
        
        // Add the sortDescritpor to the fetchRequest
        fetchRequest.sortDescriptors = [priceSort]
        
        var error: NSError?
        let items = context.executeFetchRequest(fetchRequest, error: &error) as! [CartItem]
        
        return items
    }
    
    func addItemToCart(article: Article) {
        let entitiy = NSEntityDescription.entityForName("CartItem", inManagedObjectContext: context)
        let newItem = CartItem(entity: entitiy!, insertIntoManagedObjectContext: context)
        
        newItem.itemDescription = article.description
        newItem.itemPrice = article.price
        newItem.itemName = article.name
        newItem.itemNumber = article.number
        newItem.itemImage = article.image
        
        var error: NSError?
        context.save(&error)
        
        // Keep the array up to date locally
        articlesInCart.append(newItem)
        
        if error != nil {
            println("An error occured in saving")
        }
    }
    
    func deleteArticleFromCart(article: Article) {
        let cartItem = articlesInCart.filter({$0.itemNumber == article.number})
        if let cartItem = cartItem.first {
            context.deleteObject(cartItem)
            
            let nsArticlesInCart = NSArray(array: articlesInCart)
            let indexToRemove = nsArticlesInCart.indexOfObject(cartItem)
            
            articlesInCart.removeAtIndex(indexToRemove)
        }
    }
    
    func deleteCartItemAtIndex(index: Int) {
        // Delete from context
        let cartItemToDelete = articlesInCart[index]
        context.deleteObject(cartItemToDelete)
        
        // Delete in array
        articlesInCart.removeAtIndex(index)
        
        // Save Context
        context.save(nil)
    }
    
    func deleteAllItemsFromCart() {
        for item in articlesInCart {
            context.deleteObject(item)
        }
        
        // Save the context
        context.save(nil)
        
        // Reset the local array
        articlesInCart = [CartItem]()
    }
    
    func articleIsInCart(article: Article) -> Bool {
        let articlesWithNumberInCart = articlesInCart.filter({ $0.itemNumber == article.number })
        return !articlesWithNumberInCart.isEmpty
    }
}