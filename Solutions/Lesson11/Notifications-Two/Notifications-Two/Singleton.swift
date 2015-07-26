//
//  Singleton.swift
//  Notifications-Two
//
//  Created by LOANER on 7/8/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import Foundation

class Singleton {
    static let sharedInstance = Singleton()
    var age = 18
    
    init() {
        println("singleton created")
    }
}