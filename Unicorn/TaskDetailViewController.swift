//
//  TaskDetailViewController.swift
//  Unicorn
//
//  Created by Nicole Rasquinha on 4/23/16.
//  Copyright © 2016 Nicole Rasquinha. All rights reserved.
//

import UIKit
import MapKit

// TODO fix the segue back to browse. should pop this view off the top of the stack rather than stick the previous view on top.
class TaskDetailViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var nameDetail:String!
    var descriptionDetail: String!
    var expiresIn: NSDate!
    var timePosted: NSDate!
    var likesDetail: Int!
    var userPosted: String!
    var location: MKCoordinateRegion!
    
    @IBOutlet weak var nameDetailLabel: UILabel!
    @IBOutlet weak var descriptionDetailLabel: UILabel!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var expiresInDetailLabel: UILabel!
    @IBOutlet weak var timePostedDetailLabel: UILabel!
    
    @IBOutlet weak var locationMap: MKMapView!
    
    let locationManager = CLLocationManager()
    var region:MKCoordinateRegion!
    
    @IBOutlet weak var likesDetailLabel: UILabel!

    
    @IBAction func acceptTaskDetailButton(sender: AnyObject) {
        //TODO
        // When a task is accepted, the task's status attribute should be changed to 'ongoing'.
        //TODO
        // User should also be redirected to the map view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameDetailLabel.text = "Task: " + nameDetail
        
        userName.text = userPosted
        descriptionDetailLabel.text = "Description: " + descriptionDetail
        likesDetailLabel.text = "Likes: " + String(likesDetail)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let expiry = dateFormatter.stringFromDate(expiresIn)
        expiresInDetailLabel.text = "Expires at: " + expiry
        
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()
        self.locationMap.showsUserLocation = true
    }
    
    
    /*
     Core Location Delegates Marker
     */
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        self.locationMap.setRegion(self.location, animated: true)
        
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
        let destinationNavigationController = segue.destinationViewController as! UINavigationController
        let targetController = destinationNavigationController.topViewController as! UserProfileViewController
        targetController.profileName = userPosted
        
    }
}
