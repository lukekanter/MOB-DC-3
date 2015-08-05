//
//  ViewController.swift
//  GeoFence
//
//  Created by LOANER on 8/2/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import MapKit

class ViewController: UIViewController, AddFenceDelegate, CLLocationManagerDelegate, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            mapView.delegate = self
        }
    }
    
    let fenceStore = FenceStore.sharedStore
    var locationManager = CLLocationManager()
    var fences = [Fence]() {
        didSet {
            self.navigationItem.title = "Geo fences (\(fences.count))"
            navigationItem.rightBarButtonItem?.enabled = fences.count < 20
        }
    }
    
    let annotationIdentifier = "geoFenceCallout"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Listen to locationmanager delegate methods
        locationManager.delegate = self
        
        // Request permission for location use
        locationManager.requestAlwaysAuthorization()
        
        // Get fences from core data
        fences = fenceStore.getAllFences()
        
        for fence in fences {
            // Add it to the map
            mapView.addAnnotation(fence)
            
            // Add a radius to the map
            addRadiusOverlayForFence(fence)
        }
    }

    @IBAction func locateMe(sender: UIBarButtonItem) {
        zoomToCurrentUserLocationInMap(mapView)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showAdd" {
            let destinationVC = segue.destinationViewController as! UINavigationController
            let addVC = destinationVC.topViewController as! AddViewController
            
            addVC.delegate = self
        }
    }
    
    func startMonitoringFence(fence: Fence) {
        // Do check if montioring is available
        if !CLLocationManager.isMonitoringAvailableForClass(CLCircularRegion) {
            showSimpleAlertWithTitle("Error",
                message: "Geofencing is not supported on this device!",
                viewController: self)
            return
        }
        
        // Check if we always can grab the location
        if CLLocationManager.authorizationStatus() != .AuthorizedAlways {
            showSimpleAlertWithTitle("Warning",
                message: "Your geotification is saved but will only be activated once you grant Geotify permission to access the device location.",
                viewController: self)
        }
        
        // Get a circular region for the fence
        let region = regionWithFence(fence)
        
        // tell the locationManager to start monitoring
        locationManager.startMonitoringForRegion(region)
    }
    
    func stopMonitoringForFence(fence: Fence) {
        println("Stop monitoring for fence with uuid \(fence.uuid)")
        for region in locationManager.monitoredRegions {
            if let circularRegion = region as? CLCircularRegion {
                if circularRegion.identifier == fence.uuid {
                    println("Stopped monitoring for region")
                    locationManager.stopMonitoringForRegion(circularRegion)
                }
            }
        }
    }
    
    // MARK: - AddFenceDelegate
    func addFenceWithCoordinate(coordinate: CLLocationCoordinate2D,
        radius: Double, note: String, uuid: String, eventType: EventType) {
            let mappedRadius = (radius > locationManager.maximumRegionMonitoringDistance) ? locationManager.maximumRegionMonitoringDistance : radius
            
            // Create a new fence in core data
            let newFence = fenceStore.addFence(coordinate, uuid: uuid, radius: mappedRadius,
                fireMoment: eventType, note: note)
            
            // Append it to the array
            fences.append(newFence)
            
            // Add it to the map 
            mapView.addAnnotation(newFence)
            
            // Add a radius to the map
            addRadiusOverlayForFence(newFence)
            
            // Start monitoring
            startMonitoringFence(newFence)
            
    }
    
    // MARK: - Radius helper methods
    func addRadiusOverlayForFence(fence: Fence) {
        mapView.addOverlay(MKCircle(centerCoordinate: fence.coordinate, radius: fence.radius))
    }
    
    func removeRadiusOverlayForFence(fence: Fence) {
        for overlay in mapView.overlays {
            if let circleOverlay = overlay as? MKCircle {
                let coordinate = circleOverlay.coordinate
                if coordinate.latitude == fence.latitude &&
                    coordinate.longitude == fence.longitude &&
                    circleOverlay.radius == fence.radius {
                        mapView.removeOverlay(circleOverlay)
                }
            }
        }
    }
    
    // MARK: - Location Manager delegate methods
    func locationManager(manager: CLLocationManager!,
        didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        mapView.showsUserLocation = (status == .AuthorizedAlways)
    }

    // MARK: - MapKit Delegate methods
    func mapView(mapView: MKMapView!,
        rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
            
            if overlay is MKCircle {
                var circleRenderer = MKCircleRenderer(overlay: overlay)
                circleRenderer.lineWidth = 1.0
                circleRenderer.strokeColor = UIColor.purpleColor()
                circleRenderer.fillColor = UIColor.purpleColor().colorWithAlphaComponent(0.4)
                return circleRenderer
            }
        
            return nil
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if annotation is Fence {
            // Dequeue an callout
            var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(annotationIdentifier)
            
            if annotationView == nil {
                // No annotations in memory
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
                annotationView.canShowCallout = true
                
                var removeButton = UIButton.buttonWithType(.Custom) as! UIButton
                removeButton.frame = CGRect(x: 0, y: 0, width: 23, height: 23)
                removeButton.setImage(UIImage(named: "DeleteGeotification")!, forState: .Normal)
                annotationView?.leftCalloutAccessoryView = removeButton
            } else {
                // Was able to get a callout form memory
                annotationView.annotation = annotation
            }
            
            return annotationView
        }
        
        return nil
    }
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        // Delete geotification
        var fence = view.annotation as! Fence
        
        stopMonitoringForFence(fence)
        
        // Delete form map
        mapView.removeAnnotation(fence)
        
        // Remove overlay
        removeRadiusOverlayForFence(fence)
        
        // Delete from Core Data
        fenceStore.deleteFence(fence)
        fenceStore.saveContext()
        
        let index = find(fences, fence)
        if let index = index {
            fences.removeAtIndex(index)
        }
    }
    
    // MARK: - Misc
    // We can't pass our Fence objects to iOS to have it monitor the geofences
    // iOS expects CLCircularRegions, for that reason we write a converter here
    func regionWithFence(fence: Fence) -> CLCircularRegion {
        let region = CLCircularRegion(center: fence.coordinate,
            radius: fence.radius, identifier: fence.uuid)
        
        region.notifyOnEntry = (fence.eventType == .entry)
        region.notifyOnExit = !region.notifyOnEntry
        
        return region
    }

}

