//
//  CartItemTableViewCell.swift
//  ShopApp
//
//  Created by LOANER on 7/25/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class CartItemTableViewCell: UITableViewCell {
    @IBOutlet weak var itemImage: UIImageView! {
        didSet {
            itemImage.layer.cornerRadius = 25
        }
    }
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    var cartItem: CartItem? {
        didSet {
            itemName.text = cartItem?.itemName
            itemPrice.text = "$\(cartItem!.itemPrice)"
            
            let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
            dispatch_async(queue, { () -> Void in
                let aImage = UIImage.RBResizeImage(UIImage(named: self.cartItem!.itemImage)!,
                    targetSize: CGSizeMake(self.itemImage.frame.width, 400))
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.itemImage.image = aImage
                })
            })
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
