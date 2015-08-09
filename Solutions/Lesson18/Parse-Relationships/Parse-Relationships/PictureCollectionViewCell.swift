//
//  PictureCollectionViewCell.swift
//  Parse-Relationships
//
//  Created by LOANER on 8/6/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit
import Parse

class PictureCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    var currentPicture: PFObject? {
        didSet {
            let file = currentPicture!["picture"] as! PFFile
            file.getDataInBackgroundWithBlock { (imageData, error) -> Void in
                let newImage = UIImage(data: imageData!)
                self.imageView.image = newImage
            }
        }
    }
}
