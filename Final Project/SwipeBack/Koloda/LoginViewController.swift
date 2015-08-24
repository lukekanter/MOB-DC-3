//


import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var signUpScreenButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Programmatic UI changes
        self.view.backgroundColor = UIColor.blackColor()
        loginButton.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        let user = PFUser.currentUser()
        // If the user is already logged in, dismiss the login view controller
        if let user = user {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
   
    @IBAction func loginWithParse(sender: UIButton) {
        // Check that both fields have text entered
        if usernameField.text != "" && passwordField.text != "" {
            // Call login function
            PFUser.logInWithUsernameInBackground(usernameField.text, password: passwordField.text, block: { (user, error) -> Void in
                if let user = user {
                    println("user successfully logged in")
                    // If successful, dismiss the login view controller
                    self.dismissViewControllerAnimated(true, completion: nil)
                } else if error != nil {
                    self.loginLabel.text = "Login error, please try again"
                } else {
                    self.loginLabel.text = "Login unsuccessful, please try again"
                }
            })
        }
    }

    @IBAction func cancelLogin(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    

}
