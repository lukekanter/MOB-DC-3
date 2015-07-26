//
//  ProductCollectionViewCell.swift
//  CoreData
//
//  Created by LOANER on 7/25/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleName: UILabel!
    @IBOutlet weak var articlePrice: UILabel!
    var cellArticle: Article? {
        didSet {
            articleName.text = cellArticle?.name
            articlePrice.text = "$\(cellArticle!.price)"
            
            let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
            dispatch_async(queue, { () -> Void in
                let aImage = UIImage.RBResizeImage(UIImage(named: self.cellArticle!.image)!,
                    targetSize: CGSizeMake(self.articleImage.frame.width, 400))
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.articleImage.image = aImage
                })
            })
        }
    }
}
