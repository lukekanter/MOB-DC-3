//
//  ModalViewController.swift
//  LukeKanterHW3
//
//  Created by Luke Kanter on 7/6/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    @IBOutlet weak var imageOfMe: UIImageView!
    @IBOutlet weak var dismissButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
        
        
        
    }

    @IBAction func dismissView(sender: AnyObject) {
        println("Dismiss")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
