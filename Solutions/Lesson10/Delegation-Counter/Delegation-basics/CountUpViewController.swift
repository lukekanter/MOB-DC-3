//
//  CountUpViewController.swift
//  Delegation-basics
//
//  Created by LOANER on 7/6/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

protocol CountUpDelegate {
    func addOneToLabel()
}

class CountUpViewController: UIViewController {
    
    var delegate: CountUpDelegate?
    var time: String?

    @IBAction func addOne(sender: UIButton) {
        println("add one")
        delegate?.addOneToLabel()
    }

    @IBAction func dismiss(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
