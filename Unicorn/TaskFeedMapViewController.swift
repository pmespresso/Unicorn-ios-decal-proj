//
//  TaskFeedMapViewController.swift
//  Unicorn
//
//  Created by Clark Chen on 4/30/16.
//  Copyright © 2016 Nicole Rasquinha. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation


class TaskFeedMapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var taskFeedMapView: MKMapView!
    
    var tasks:[Task!]! = []
    var task:Task!
    var locations:[MKCoordinateRegion]! = []
    let locationManager = CLLocationManager()
    
    var specificLocation : MKCoordinateRegion!
    
    private let reuseIdentifier = "TaskCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nibs
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.taskFeedMapView.showsUserLocation = true

        //  THIS IS TO POPULATE MAP WITH ALL TASKS
        for task in People.exampleFeed {
            let dropPin = MKPointAnnotation()
            dropPin.coordinate = task.location.center
            dropPin.title = task.taskName
            
            taskFeedMapView.addAnnotation(dropPin)
        }
    }

    // Make annotations tappable, so they take the user to the annotation's task detail view
    
    
    
    
    
}