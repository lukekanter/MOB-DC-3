//
//  AddViewController.swift
//  GeoFence
//
//  Created by LOANER on 8/2/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit
import MapKit

enum EventType: Int {
    case entry = 0
    case exit = 1
}

protocol AddFenceDelegate {
    func addFenceWithCoordinate(coordinate: CLLocationCoordinate2D,
        radius: Double, note: String, uuid: String, eventType: EventType)
}

class AddViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            mapView.showsUserLocation = true
        }
    }
    @IBOutlet weak var mapViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var fireMomentControl: UISegmentedControl!
    @IBOutlet weak var distanceSlider: UISlider!
    @IBOutlet weak var noteField: UITextField!
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet var zoomButton: UIBarButtonItem!
    
    let center = NSNotificationCenter.defaultCenter()
    var delegate: AddFenceDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Keyboard notifications
        center.addObserver(self, selector: "keyboardWillShow:",
            name: UIKeyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: "keyboardWillHide:",
            name: UIKeyboardWillHideNotification, object: nil)
        
        // Add bar button
        navigationItem.rightBarButtonItems = [addButton, zoomButton]
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Force field to end editing if still active
        if noteField.isFirstResponder() {
            noteField.resignFirstResponder()
        }
    }

    @IBAction func changeDistance(sender: UISlider) {
        distanceLabel.text = "\(Int(sender.value))m"
    }
    
    @IBAction func locateMe(sender: UIBarButtonItem) {
        zoomToCurrentUserLocationInMap(mapView)
    }
    
    @IBAction func add(sender: UIBarButtonItem) {
        // Create a fire moment
        let fireMoment = EventType(rawValue: fireMomentControl.selectedSegmentIndex)!
        
        // Create a unique identifier
        let uuid = NSUUID().UUIDString
        
        // Send delegate message
        delegate?.addFenceWithCoordinate(mapView.centerCoordinate,
            radius: Double(distanceSlider.value),
            note: noteField.text, uuid: uuid, eventType: fireMoment)
        
        // Dismiss self
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - UIKeyboard Handlers
    func keyboardWillShow(notifiction: NSNotification) {
        mapViewTopConstraint.constant = -290
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }
    
    func keyboardWillHide(notification: NSNotification) {
        mapViewTopConstraint.constant = 0
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch = touches.first as! UITouch
        if noteField.isFirstResponder() && touch.view != noteField {
            noteField.resignFirstResponder()
        }
    }

    // MARK: - UITextFieldDelegate Methods
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        noteField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func noteFieldChanged(sender: UITextField) {
        addButton.enabled = sender.text != ""
    }
    
}
