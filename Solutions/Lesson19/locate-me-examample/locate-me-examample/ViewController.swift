//
//  ViewController.swift
//  locate-me-examample
//
//  Created by LOANER on 8/5/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        centerMapOnUserLocationForMapView(mapView)
    }
    
    @IBAction func findMe(sender: UIBarButtonItem) {
        // Request permission when it's the first time
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
        
        centerMapOnUserLocationForMapView(mapView)

        CLGeocoder().reverseGeocodeLocation(newLocation,
            completionHandler: { (results, error) -> Void in
                if error != nil {
                    println("error")
                    return
                }
                
                let placemarks = results as! [CLPlacemark]
                for placemark in placemarks {
                    println("\(placemark) \n\n ------------")
                }
                
                if results.count > 0 {
                    let place = results[0] as! CLPlacemark
                    println("We found you at \(place.thoroughfare) \(place.locality)")
                }
        })
        
        locationManager.stopUpdatingLocation()
    }
    
    func centerMapOnUserLocationForMapView(mapView: MKMapView) {
        if let coordinate = mapView.userLocation.location?.coordinate {
            // In here userlocation is allowed and available
            let region = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000)
            mapView.setRegion(region, animated: true)
        }
    }

}





