//
//  PicturesCollectionViewController.swift
//  Parse-Relationships
//
//  Created by LOANER on 8/6/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit
import Parse

let reuseIdentifier = "pictureCell"

class PicturesCollectionViewController: UICollectionViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var addPicture: UIBarButtonItem!
    
    var pictures = [PFObject]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println(PFUser.currentUser())
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        if let currentUser = PFUser.currentUser() {
            addPicture.enabled = true
            
            // Get pictures for current user
            let query = PFQuery(className: "Picture")
            query.whereKey("addedBy", equalTo: PFUser.currentUser()!)
            
            query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
                self.pictures = results as! [PFObject]
                self.collectionView?.reloadData()
            }
        } else {
            addPicture.enabled = false
        }
    }
    
    @IBAction func addPicture(sender: UIBarButtonItem) {
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            return
        }
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        picker.dismissViewControllerAnimated(true, completion: { () -> Void in
            let imageData = UIImagePNGRepresentation(image)
            let file = PFFile(data: imageData)
            
            
            let newPicture = PFObject(className: "Picture")
            newPicture["addedBy"] = PFUser.currentUser()
            newPicture["picture"] = file
            
            newPicture.saveInBackgroundWithBlock({ (success, error) -> Void in
                if error != nil {
                    println("Could not save picture \(error?.localizedDescription)")
                    return
                }
                
                self.pictures.append(newPicture)
                self.collectionView?.reloadData()
            })
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PictureCollectionViewCell
    
        // Configure the cell
        cell.currentPicture = pictures[indexPath.row]
    
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.collectionView!.bounds.width, 200)
    }

}
