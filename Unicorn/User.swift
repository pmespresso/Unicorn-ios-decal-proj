//
//  User.swift
//  Users
//
//  Created by YJ Kim
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import Foundation

class User {
    /* The user's rating */
    var rating : Double!
    /* The string array of requested tasks. */
    var requestedTasks : [Task]!
    /* The string array of past and present accepted tasks */
    var acceptedTasks : [Task]!
    /* The username of the tasker. */
    var username : String!
    
    /* Gets a username and creates a user object. */
    init (username: String, rating: Double, requestedTasks: [Task], acceptedTasks: [Task]) {
        self.rating = rating
        self.requestedTasks = requestedTasks
        self.acceptedTasks = acceptedTasks
        self.username = username
    }
    
    
}