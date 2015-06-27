//
//  FirstViewController.swift
//  LifecycleExample
//
//  Created by Arthur Sabintsev on 6/24/15.
//  Copyright (c) 2015 Arthur Ariel Sabintsev. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer: NSTimer?
    var counter: Int = 0
    
    override func loadView() {
        super.loadView()
        magic()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        magic()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        magic()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateLabel", userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        magic()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        magic()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        magic()
        timer?.invalidate()
        counter = 0
        timerLabel.text = nil
    }
    
    func magic(file: String = __FILE__, _ function: String = __FUNCTION__) {
        let filename = file.lastPathComponent.stringByDeletingPathExtension
        print("\(filename).\(function)\n")
    }
    
    func updateLabel() {
        ++counter;
        timerLabel.text = "\(counter)"
    }
    
}

