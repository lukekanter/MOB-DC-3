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
import MapKit

class Fence: NSManagedObject, MKAnnotation {

    @NSManaged var uuid: String
    @NSManaged var latitude: Double
    @NSManaged var longitude: Double
    @NSManaged var radius: Double
    @NSManaged var fireMoment: NSNumber
    @NSManaged var note: String
    
    var title: String {
        if note.isEmpty {
            return "No Note"
        }
        return note
    }
    
    var eventType: EventType {
        return EventType(rawValue: Int(fireMoment))!
    }
    
    var subtitle: String {
        // Display the appropriate string
        var eventTypeString = eventType == .entry ? "On Entry" : "On Exit"
        
        // Create the subtitle
        return "Radius: \(Int(radius))m - \(eventTypeString)"
    }
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }

}
