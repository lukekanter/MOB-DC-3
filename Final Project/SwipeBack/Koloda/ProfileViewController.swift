

import UIKit
import Parse


class ProfileViewController: UIViewController {

    @IBOutlet weak var overallLikesLabel: UILabel!
    @IBOutlet weak var profilePictureLikesLabel: UILabel!
    @IBOutlet weak var bodyPictureLikesLabel: UILabel!
    @IBOutlet weak var facePictureLikesLabel: UILabel!
    @IBOutlet weak var finalPictureLikesLabel: UILabel!
    @IBOutlet weak var overallPassesLabel: UILabel!
    @IBOutlet weak var profilePicturePassesLabel: UILabel!
    @IBOutlet weak var bodyPicturePassesLabel: UILabel!
    @IBOutlet weak var facePicturePassesLabel: UILabel!
    @IBOutlet weak var finalPicturePassesLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var bodyImage: UIImageView!
    @IBOutlet weak var faceImage: UIImageView!
    @IBOutlet weak var finalImage: UIImageView!
    let parseUser = PFUser.currentUser()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserProfileImages()
        setUpTapRecongizers()
        // Uncomment code below for help debugging login issues
//        let user = PFUser.currentUser()
//        if user != nil {
//            println("User is logged in!")
//        } else {
//            println("no user available")
//        }

        
    }
    
    override func viewDidAppear(animated: Bool) {
        // If logged out, return to Koloda
        if PFUser.currentUser() == nil {
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
        // Refresh scrollview images
        loadUserProfileImages()
    }

    func setUpTapRecongizers() {
        // Create tap gesture recognizers and add them to the scrollview imageviews
        let profileRecognizer = UITapGestureRecognizer(target: self, action: "profileImageSegue")
        profileImage.addGestureRecognizer(profileRecognizer)
        
        let bodyRecognizer = UITapGestureRecognizer(target: self, action: "profileImageSegue")
        bodyImage.addGestureRecognizer(bodyRecognizer)
        
        let faceRecognizer = UITapGestureRecognizer(target: self, action: "profileImageSegue")
        faceImage.addGestureRecognizer(faceRecognizer)
        
        let finalRecognizer = UITapGestureRecognizer(target: self, action: "profileImageSegue")
        finalImage.addGestureRecognizer(finalRecognizer)
    }
    
    func profileImageSegue() {
        // Create segue function to add to tap gesture recognizers
        performSegueWithIdentifier("fullScreenSegue", sender: nil)
    }
    
    
    func loadUserProfileImages() {
        // Load imageviews with the current user's saved pictures
        if let parseUser = parseUser {
            if let profilePicture = parseUser["profilePicture"] {
                PFQuery.getUserObjectWithId(parseUser.objectId!)
                let profileImageFile = profilePicture as! PFFile
                profileImageFile.getDataInBackgroundWithBlock({ (imageData, error) -> Void in
                    if let imageData = imageData {
                        let convertedProfileImage = UIImage(data: imageData)
                        self.profileImage.image = convertedProfileImage
                        self.profileImage.contentMode = UIViewContentMode.ScaleAspectFill
                    }
                })
            }
            if let bodyPicture = parseUser["bodyPicture"] {
                let bodyImageFile = bodyPicture as! PFFile
                bodyImageFile.getDataInBackgroundWithBlock({ (imageData, error) -> Void in
                    if let imageData = imageData {
                        let convertedProfileImage = UIImage(data: imageData)
                        self.bodyImage.image = convertedProfileImage
                        self.bodyImage.contentMode = UIViewContentMode.ScaleAspectFill
                    }
                })
            }
            
            if let facePicture = parseUser["facePicture"] {
                let faceImageFile = facePicture as! PFFile
                faceImageFile.getDataInBackgroundWithBlock({ (imageData, error) -> Void in
                    if let imageData = imageData {
                        let convertedProfileImage = UIImage(data: imageData)
                        self.faceImage.image = convertedProfileImage
                        self.faceImage.contentMode = UIViewContentMode.ScaleAspectFill
                    }
                })
            }
            
            if let finalPicture = parseUser["finalPicture"] {
                let finalImageFile = finalPicture as! PFFile
                finalImageFile.getDataInBackgroundWithBlock({ (imageData, error) -> Void in
                    if let imageData = imageData {
                        let convertedProfileImage = UIImage(data: imageData)
                        self.finalImage.image = convertedProfileImage
                        self.finalImage.contentMode = UIViewContentMode.ScaleAspectFill
                    }
                })
            }
        }
    }
    
    

}
