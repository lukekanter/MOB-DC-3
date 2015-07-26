//
//  CartItem.swift
//  ShopApp
//
//  Created by LOANER on 7/25/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import Foundation
import CoreData

class CartItem: NSManagedObject {

    @NSManaged var itemNumber: String
    @NSManaged var itemPrice: NSNumber
    @NSManaged var itemName: String
    @NSManaged var itemImage: String
    @NSManaged var itemDescription: String

}
