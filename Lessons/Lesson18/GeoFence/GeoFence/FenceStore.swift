//
//  FenceStore.swift
//  GeoFence
//
//  Created by LOANER on 8/2/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import Foundation
import MapKit
import CoreData

class FenceStore {
    
    static let sharedStore = FenceStore()
    private var context: NSManagedObjectContext!
    
    init() {
        // Get a reference to the app delegate
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Save a reference to the context
        context = delegate.managedObjectContext
    }
    
    func addFence(coordinate: CLLocationCoordinate2D, uuid: String,
        radius: Double, fireMoment: EventType, note: String) -> Fence {
            // Create a new nsmanaged object context
            let newFence = NSEntityDescription.insertNewObjectForEntityForName("Fence",
                inManagedObjectContext: context) as! Fence
            
            newFence.latitude = coordinate.latitude
            newFence.longitude = coordinate.longitude
            newFence.uuid = uuid
            newFence.radius = radius
            newFence.fireMoment = fireMoment.hashValue
            newFence.note = note

            var error: NSError?
            context.save(&error)
            
            if error != nil {
                println("Could not save new fence \(error?.localizedDescription)")
            }
            
            return newFence
    }
    
    func getAllFences() -> [Fence] {
        // Create a fetch request
        let fetchRequest = NSFetchRequest(entityName: "Fence")
        
        var error: NSError?
        let results = context.executeFetchRequest(fetchRequest, error: &error) as! [Fence]
        
        if error != nil {
            println("Could not get fences from core data \(error?.localizedDescription)")
        }
        
        return results
    }
    
    func deleteFence(fence: Fence) {
        context.deleteObject(fence)
    }
    
    func saveContext() {
        var error: NSError?
        
        context.save(&error)
        
        if error != nil {
            println("Could not save the context \(error?.localizedDescription)")
        }
    }
    
}