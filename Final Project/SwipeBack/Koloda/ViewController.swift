

import UIKit
import Koloda
import Parse
import ParseFacebookUtilsV4

private var numberOfCards: UInt = 5

//protocol ImagesForKolodaCardsDelegate {
//    var imageViewsToReturn: [UIImageView] {get}
//    func grabImageViews()
//}

class ViewController: UIViewController, KolodaViewDataSource, KolodaViewDelegate {
    
//    var delegate: ImagesForKolodaCardsDelegate?
    @IBOutlet weak var kolodaView: KolodaView!
    

    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        kolodaView.dataSource = self
        kolodaView.delegate = self
        navigationController?.navigationBar.barTintColor = UIColor.blackColor()
    }
    override func viewDidAppear(animated: Bool) {
        let user = PFUser.currentUser()
        if user == nil {
            performSegueWithIdentifier("loginSegue", sender: AnyObject?())
            
        }
    }
    
    
    //MARK: IBActions
    @IBAction func leftButtonTapped() {
        kolodaView?.swipe(SwipeResultDirection.Left)
    }
    
    @IBAction func rightButtonTapped() {
        kolodaView?.swipe(SwipeResultDirection.Right)
    }
    
    
    //MARK: KolodaViewDataSource
    func kolodaNumberOfCards(koloda: KolodaView) -> UInt {
        return numberOfCards
    }
    // Luke's Note: Set image for card. May need to name all images "Card_like_(index number)"
    func kolodaViewForCardAtIndex(koloda: KolodaView, index: UInt) -> UIView {
        return UIImageView(image: UIImage(named: "Card_like_\(index + 1)"))
//        if let delegate = UIApplication.sharedApplication().delegate as? AppDelegate {
//            return delegate.imageViewsToReturn[Int(index)]
//        }
//        
//        return UIView()
    }
    func kolodaViewForCardOverlayAtIndex(koloda: KolodaView, index: UInt) -> OverlayView? {
        return NSBundle.mainBundle().loadNibNamed("OverlayView",
            owner: self, options: nil)[0] as? OverlayView
    }
    
    //MARK: KolodaViewDelegate
    
    func kolodaDidSwipedCardAtIndex(koloda: KolodaView, index: UInt, direction: SwipeResultDirection) {
    //Example: loading more cards
        if index >= 3 {
            numberOfCards = 6
            kolodaView.reloadData()
        }
    }
    // Luke's Note: Set a state for when the user swipes through all their cards
    func kolodaDidRunOutOfCards(koloda: KolodaView) {
    //Example: reloading
        kolodaView.resetCurrentCardNumber()
    }
    
    
    // Luke's Note: use this function to redirect to individual profile
    func kolodaDidSelectCardAtIndex(koloda: KolodaView, index: UInt) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://yalantis.com/")!)
    }
    
    func kolodaShouldApplyAppearAnimation(koloda: KolodaView) -> Bool {
        return true
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

