//
//  Task.swift
//  Unicorn
//
//  Created by Nicole Rasquinha on 4/23/16.
//  Copyright © 2016 Nicole Rasquinha. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class Task {
    /* The task's name */
    var taskName : String!
    /* The task's description */
    var taskDesc : String!
    /* The task's Likes */
    var taskLikes : Int!
    /* The task's creator username */
    var userPosted : String!
    /* Time remaining till task expiration */
    var expires : NSDate!
    /* Task location */
    var location = MKCoordinateRegion()
    /* Task status: complete/running/requesting/inactive */
    var status : String!
    
    init(taskName: String, taskDesc: String, taskLikes: Int, userPosted: String, status: String, location: MKCoordinateRegion, expires: NSDate) {

        self.taskName = taskName
        self.taskDesc = taskDesc
        self.taskLikes = taskLikes
        self.userPosted = userPosted
        self.expires = expires
        self.status = status
        self.location = location
    }
}
