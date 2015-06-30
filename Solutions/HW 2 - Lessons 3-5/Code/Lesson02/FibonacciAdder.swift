//
//  FibonacciAdder.swift
//  Lesson02
//
//  Created by Arthur Sabintsev on 6/28/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import Foundation

class FibonacciAdder {

    func numberAtIndex(number: Int) -> Int {
        
        var retVal: Int = 0
        if number >= 0 {
            if number == 0 {
                retVal = 0
            } else if number == 1 {
                retVal = 1
            } else {
                for i in 2...number {
                    retVal = numberAtIndex(i-1) + numberAtIndex(i-2)
                }
            }
        }
        
        return retVal
    }
    
}