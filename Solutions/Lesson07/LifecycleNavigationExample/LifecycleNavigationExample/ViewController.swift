//
//  ViewController.swift
//  LifecycleNavigationExample
//
//  Created by Arthur Sabintsev on 6/24/15.
//  Copyright (c) 2015 Arthur Ariel Sabintsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    }
    
    func magic(file: String = __FILE__, _ function: String = __FUNCTION__, _ line: Int = __LINE__) {
        let filename = file.lastPathComponent.stringByDeletingPathExtension
        print("\(filename).\(function)[\(line)]\n")
    }

}

