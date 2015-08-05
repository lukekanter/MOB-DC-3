//
//  ViewController.swift
//  GeoFence
//
//  Created by LOANER on 8/2/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, AddFenceDelegate {
    
    let fenceStore = FenceStore.sharedStore
    var fences = [Fence]() {
        didSet {
            self.navigationItem.title = "Geo fences (\(fences.count))"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get fences from core data
        fences = fenceStore.getAllFences()
    }

    @IBAction func locateMe(sender: UIBarButtonItem) {
        println("Locate me")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showAdd" {
            let destinationVC = segue.destinationViewController as! UINavigationController
            let addVC = destinationVC.topViewController as! AddViewController
            
            addVC.delegate = self
        }
    }
    
    func addFenceWithCoordinate(coordinate: CLLocationCoordinate2D,
        radius: Double, note: String, uuid: String, eventType: EventType) {
            fenceStore.addFence(coordinate, uuid: uuid, radius: radius,
                fireMoment: eventType, note: note)
    }


}

