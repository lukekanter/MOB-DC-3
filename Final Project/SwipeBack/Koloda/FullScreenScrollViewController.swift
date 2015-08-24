//
//  FullScreenScrollViewController.swift
//  Koloda
//
//  Created by Luke Kanter on 8/17/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import UIKit
import Parse

class FullScreenScrollViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fullScreenProfileImage: UIImageView!
    @IBOutlet weak var fullScreenBodyImage: UIImageView!
    @IBOutlet weak var fullScreenFaceImage: UIImageView!
    @IBOutlet weak var fullScreenFinalImage: UIImageView!
    let parseUser = PFUser.currentUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserProfileImages()
        let heightConstraint = NSLayoutConstraint(item: scrollView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(heightConstraint)
        
        scrollView.pagingEnabled = true
        scrollView.directionalLockEnabled = true
        
       
    }

    func loadUserProfileImages() {
        if let parseUser = parseUser {
            if let profilePicture = parseUser["profilePicture"] {
                PFQuery.getUserObjectWithId(parseUser.objectId!)
                let profileImageFile = profilePicture as! PFFile
                profileImageFile.getDataInBackgroundWithBlock({ (imageData, error) -> Void in
                    if let imageData = imageData {
                        let convertedProfileImage = UIImage(data: imageData)
                        self.fullScreenProfileImage.image = convertedProfileImage
                        self.fullScreenProfileImage.contentMode = UIViewContentMode.ScaleAspectFill
                    }
                })
            }
            if let bodyPicture = parseUser["bodyPicture"] {
                let bodyImageFile = bodyPicture as! PFFile
                bodyImageFile.getDataInBackgroundWithBlock({ (imageData, error) -> Void in
                    if let imageData = imageData {
                        let convertedProfileImage = UIImage(data: imageData)
                        self.fullScreenBodyImage.image = convertedProfileImage
                        self.fullScreenBodyImage.contentMode = UIViewContentMode.ScaleAspectFill
                    }
                })
            }
            
            if let facePicture = parseUser["facePicture"] {
                let faceImageFile = facePicture as! PFFile
                faceImageFile.getDataInBackgroundWithBlock({ (imageData, error) -> Void in
                    if let imageData = imageData {
                        let convertedProfileImage = UIImage(data: imageData)
                        self.fullScreenFaceImage.image = convertedProfileImage
                        self.fullScreenFaceImage.contentMode = UIViewContentMode.ScaleAspectFill
                    }
                })
            }
            
            if let finalPicture = parseUser["finalPicture"] {
                let finalImageFile = finalPicture as! PFFile
                finalImageFile.getDataInBackgroundWithBlock({ (imageData, error) -> Void in
                    if let imageData = imageData {
                        let convertedProfileImage = UIImage(data: imageData)
                        self.fullScreenFinalImage.image = convertedProfileImage
                        self.fullScreenFinalImage.contentMode = UIViewContentMode.ScaleAspectFill
                    }
                })
            }
        }
    }


}
