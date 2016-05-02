//
//  CreateTaskViewController.swift
//  Unicorn
//
//  Created by Nicole Rasquinha on 4/23/16.
//  Copyright © 2016 Nicole Rasquinha. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CreateTaskViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    var taskToAdd:Task!
    
    @IBOutlet weak var taskTitleField: UITextField!
    
    @IBOutlet weak var taskDescField: UITextField!
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    @IBOutlet weak var expiresLabel: UILabel!
    
    @IBOutlet weak var locationMap: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var region:MKCoordinateRegion!
    
    var date:NSDate = NSDate()
    
    @IBAction func datePickerAction(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let strDate = dateFormatter.stringFromDate(myDatePicker.date)
        self.expiresLabel.text = "Expires at: " + strDate
        self.date = myDatePicker.date
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myDatePicker.datePickerMode = UIDatePickerMode.Time
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.locationMap.showsUserLocation = true
    }

    /* 
        Core Location Delegates Marker
     */
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        
        self.region = region
        self.locationMap.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Errors: " + error.localizedDescription)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //TODO : User Friendly error when fields are blank.
        if self.region == nil {
            self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(
                latitude: 34.052235,
                longitude: -118.243683
                ), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        }
        taskToAdd = Task(taskName: taskTitleField.text!, taskDesc: taskDescField.text!, taskLikes: 0, userPosted: "YJ Kim", status: "inactive", expires: self.date, location: self.region)
        
        People.addTask(taskToAdd)
    }
    
}
