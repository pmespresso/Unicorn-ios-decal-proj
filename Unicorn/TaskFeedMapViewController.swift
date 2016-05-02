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
    var people:People! = People()
    var locations:[MKCoordinateRegion]! = []
    let locationManager = CLLocationManager()
    
    private let reuseIdentifier = "TaskCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //        self.taskFeedMap.delegate = self
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.taskFeedMapView.showsUserLocation = true
        
        
        
        // THIS WORKS NewYork Pin
        
        let newYorkLocation = CLLocationCoordinate2DMake(40.730872, -74.003066)
        // Drop a pin
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = newYorkLocation
        dropPin.title = "New York City"
        taskFeedMapView.addAnnotation(dropPin)
//        
//        for task in people.exampleFeed {
//            
//            
//            print(task)
//            locations.append(taskLocation)
////            dropPin.title = "Test"
////            taskFeedMapView.addAnnotation(dropPin)
//            
//            
//        }
        
    }
    
    
    // Map Delegate Methods
//        func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
//            if (annotation is MKUserLocation) {
//                return nil
//            }
//    
//            if (annotation.isKindOfClass(CustomAnnotation)) {
//                let customAnnotation = annotation as? CustomAnnotation
//                mapView.translatesAutoresizingMaskIntoConstraints = false
//                var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier("CustomAnnotation") as MKAnnotationView!
//    
//                if (annotationView == nil) {
//                    annotationView = customAnnotation?.annotationView()
//                } else {
//                    annotationView.annotation = annotation;
//                }
//    
//                self.addBounceAnimationToView(annotationView)
//                return annotationView
//            } else {
//                return nil
//            }
//        }
    
    
}