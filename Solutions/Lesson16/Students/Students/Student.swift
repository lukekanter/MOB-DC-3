//
//  Student.swift
//  Students
//
//  Created by Luke Kanter on 7/27/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import Foundation
import CoreData

class Student: NSManagedObject {

    @NSManaged var location: String
    @NSManaged var name: String

}
