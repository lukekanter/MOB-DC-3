//
//  Fence.swift
//  GeoFence
//
//  Created by LOANER on 8/2/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import Foundation
import CoreData
import CoreLocation

class Fence: NSManagedObject {

    @NSManaged var uuid: String
    @NSManaged var latitude: Double
    @NSManaged var longitude: Double
    @NSManaged var radius: Double
    @NSManaged var fireMoment: NSNumber
    @NSManaged var note: String
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }

}
