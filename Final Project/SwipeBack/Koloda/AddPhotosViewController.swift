//
//  AddPhotosViewController.swift
//  Koloda
//
//  Created by Luke Kanter on 8/23/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import UIKit
import Parse

class AddPhotosViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var bodyImageView: UIImageView!
    @IBOutlet weak var faceImageView: UIImageView!
    @IBOutlet weak var finalImageView: UIImageView!
    @IBOutlet weak var addProfileImageButton: UIButton!
    @IBOutlet weak var addBodyImageButton: UIButton!
    @IBOutlet weak var addFaceImageButton: UIButton!
    @IBOutlet weak var addFinalImageButton: UIButton!
    var selectedButton = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        loadUserImages()
    }
    
    func loadUserImages() {
        if let parseUser = PFUser.currentUser() {
            if let profilePicture = parseUser["profilePicture"] {
                PFQuery.getUserObjectWithId(parseUser.objectId!)
                let profileImageFile = profilePicture as! PFFile
                profileImageFile.getDataInBackgroundWithBlock({ (imageData, error) -> Void in
                    if let imageData = imageData {
                        let convertedProfileImage = UIImage(data: imageData)
                        self.profileImageView.image = convertedProfileImage
                        self.profileImageView.contentMode = UIViewContentMode.ScaleAspectFill
                    }
                })
            }
        }
        if let parseUser = PFUser.currentUser() {
            if let bodyPicture = parseUser["bodyPicture"] {
                PFQuery.getUserObjectWithId(parseUser.objectId!)
                let bodyImageFile = bodyPicture as! PFFile
                bodyImageFile.getDataInBackgroundWithBlock({ (imageData, error) -> Void in
                    if let imageData = imageData {
                        let convertedBodyImage = UIImage(data: imageData)
                        self.bodyImageView.image = convertedBodyImage
                        self.bodyImageView.contentMode = UIViewContentMode.ScaleAspectFill
                    }
                })
            }
        }
        if let parseUser = PFUser.currentUser() {
            if let facePicture = parseUser["facePicture"] {
                PFQuery.getUserObjectWithId(parseUser.objectId!)
                let faceImageFile = facePicture as! PFFile
                faceImageFile.getDataInBackgroundWithBlock({ (imageData, error) -> Void in
                    if let imageData = imageData {
                        let convertedFaceImage = UIImage(data: imageData)
                        self.faceImageView.image = convertedFaceImage
                        self.faceImageView.contentMode = UIViewContentMode.ScaleAspectFill
                    }
                })
            }
        }
        if let parseUser = PFUser.currentUser() {
            if let finalPicture = parseUser["finalPicture"] {
                PFQuery.getUserObjectWithId(parseUser.objectId!)
                let finalImageFile = finalPicture as! PFFile
                finalImageFile.getDataInBackgroundWithBlock({ (imageData, error) -> Void in
                    if let imageData = imageData {
                        let convertedFinalImage = UIImage(data: imageData)
                        self.finalImageView.image = convertedFinalImage
                        self.finalImageView.contentMode = UIViewContentMode.ScaleAspectFill
                    }
                })
            }
        }
    }
    
    @IBAction func addProfilePictureAction(sender: UIButton) {
        // Make sure the image picker is available
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            return
        }
        // Save the sender so we know which image to upload the file to
        if sender == addProfileImageButton {
            selectedButton = "profile"
        } else if sender == addBodyImageButton {
            selectedButton = "body"
        } else if sender == addFaceImageButton {
            selectedButton = "face"
        } else if sender == addFinalImageButton {
            selectedButton = "final"
        }
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        let imageData = UIImagePNGRepresentation(image)
        let file = PFFile(data: imageData)
        if let user = PFUser.currentUser() {
            // Upload the specified picture to Parse
            user["\(selectedButton)Picture"] = file
            // Save the PFUser
            user.saveInBackgroundWithBlock({ (succeeded, error) -> Void in
                // Handle errors
                if error != nil {
                    println("Could not save picture \(error?.localizedDescription)")
                    return
                } else if succeeded == true {
                    // If successful dismiss the view controller
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            })
        }
        

    }

    

}
