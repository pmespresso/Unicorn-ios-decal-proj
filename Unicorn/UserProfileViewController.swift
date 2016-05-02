//
//  UserProfileViewController.swift
//  Unicorn
//
//  Created by Everest Shi on 5/1/16.
//  Copyright © 2016 Nicole Rasquinha. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class UserProfileViewController: UIViewController {
    
    var profileName: String!
    var people: People = People()
    var user: User!
    
    @IBOutlet var userRating: UILabel!
    
    @IBOutlet var userProfileName: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        if profileName == nil {
            profileName = "YJ Kim"
        }
        self.user = people.peopleDatabase.valueForKey(profileName) as! User
        userProfileName.title = profileName
        userRating.text = String("Rating: ") + String(user.rating)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "RequestedTasks" || segue.identifier == "AcceptedTasks" {
            let destinationNavigationController = segue.destinationViewController as! UINavigationController
            let userTasksView = destinationNavigationController.topViewController as! UserTaskFeedTableViewController
            userTasksView.user = user
            if segue.identifier == "RequestedTasks" {
                userTasksView.tasks = user.requestedTasks
            }
            else {
                userTasksView.tasks = user.acceptedTasks
            }
        }
        
    }
    
    
}
