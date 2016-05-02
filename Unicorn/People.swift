//
//  People.swift
//  Unicorn
//
//  Created by Young Joong Kim on 4/30/16.
//  Copyright © 2016 Nicole Rasquinha. All rights reserved.
//

import Foundation

import UIKit
import MapKit
import CoreLocation

class People {
    //taskName: String, taskDesc: String, taskUpvotes: Int, taskDownvotes:Int, userPosted: String, status: String
    
    var center:CLLocationCoordinate2D
    var exampleFeed:[Task]! = []
    var date:NSDate!
    var peopleDatabase: NSMutableDictionary! = NSMutableDictionary()
    var me: User!
    
    init() {
        self.center = CLLocationCoordinate2D(
            latitude: 16.40,
            longitude: -86.34
        )
        
        self.date = NSDate()
        
        self.exampleFeed = [Task(taskName: "CS70 Help", taskDesc: "HELP MEEE IM DYING", taskLikes: 5, userPosted: "Ryan Richards", status: "inactive", location: MKCoordinateRegion(center: self.center, span: MKCoordinateSpanMake(1, 1)), expires: self.date),
        
            Task(taskName: "i need an umbrella", taskDesc: "it's raining and i have no umbrella. i'm near soda. ", taskLikes: 10, userPosted: "Cal Wilmott", status: "active", location: MKCoordinateRegion(center: self.center, span: MKCoordinateSpanMake(1, 1)), expires: self.date),
                
            Task(taskName: "Get me Chipotle", taskDesc: "If you're nearby or something just get me a burrito bowl please thanks.", taskLikes: 484, userPosted: "Jill McAdams", status: "active",location: MKCoordinateRegion(center: self.center, span: MKCoordinateSpanMake(1, 1)), expires: self.date),
                
            Task(taskName: "Need a ride to class", taskDesc: "anyone have a car?", taskLikes: 10, userPosted: "Jane Austin", status: "active", location: MKCoordinateRegion(center: self.center, span: MKCoordinateSpanMake(1, 1)), expires: self.date)
        ]
        
        
        let ploopTask = Task(taskName: "I need help with IOS RIPME", taskDesc: "This is due tonight i hate life", taskLikes: 9001, userPosted: "Nerissa Lin", status: "completed", location: MKCoordinateRegion(center: self.center, span: MKCoordinateSpanMake(1, 1)), expires: NSDate(timeInterval: -3600, sinceDate: NSDate()))
        
        self.peopleDatabase.setValue(User(username: "Ryan Richards", rating: 4.5, requestedTasks: [self.exampleFeed[0]], acceptedTasks: [ploopTask]), forKey: "Ryan Richards")
        self.peopleDatabase.setValue(User(username: "Cal Wilmott", rating: 3.0, requestedTasks: [self.exampleFeed[1]], acceptedTasks: [ploopTask]), forKey: "Cal Wilmott")
        self.peopleDatabase.setValue(User(username: "Jill McAdams", rating: 4.1, requestedTasks: [self.exampleFeed[2]], acceptedTasks: [ploopTask]), forKey: "Jill McAdams")
        self.peopleDatabase.setValue(User(username: "Jane Austin", rating: 4.7, requestedTasks: [self.exampleFeed[3]], acceptedTasks: [ploopTask]), forKey: "Jane Austin")
        self.peopleDatabase.setValue(User(username: "Nerissa Lin", rating: 6.9, requestedTasks: [ploopTask], acceptedTasks: []), forKey: "Nerissa Lin")
        
        self.me = User(username: "YJ Kim", rating: 5.0, requestedTasks: [], acceptedTasks: [])
        self.peopleDatabase.setValue(self.me, forKey: "YJ Kim")
        
        
    }
}