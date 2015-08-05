//
//  Utilities.swift
//  GeoFence
//
//  Created by LOANER on 8/2/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit
import MapKit

func zoomToCurrentUserLocationInMap(mapView: MKMapView) {
    if let coordinate = mapView.userLocation.location?.coordinate {
        let region = MKCoordinateRegionMakeWithDistance(coordinate, 5000, 5000)
        mapView.setRegion(region, animated: true)
    }
}

func showSimpleAlertWithTitle(title: String!, #message: String, #viewController: UIViewController) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    let action = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
    alert.addAction(action)
    viewController.presentViewController(alert, animated: true, completion: nil)
}