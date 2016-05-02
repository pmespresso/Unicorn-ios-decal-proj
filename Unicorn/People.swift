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
    var losAngeles:CLLocationCoordinate2D
    var paloAlto:CLLocationCoordinate2D
    var china:CLLocationCoordinate2D
    static var exampleFeed:[Task]! = []
    var date:NSDate!
    static var peopleDatabase: NSMutableDictionary! = NSMutableDictionary()
    static var me: User!
    
    init() {
        self.center = CLLocationCoordinate2D(
            latitude: 16.40,
            longitude: -86.34
        )
        
        self.losAngeles = CLLocationCoordinate2D(
            latitude: 34.052235,
            longitude: -118.243683
        )
        
        self.paloAlto = CLLocationCoordinate2D(
            latitude: 37.468319,
            longitude: -122.143936
        )
        
        self.china = CLLocationCoordinate2D(
            latitude: 35.8617,
            longitude: 104.1954
        )
        
        self.date = NSDate()
        
        People.exampleFeed = [Task(taskName: "CS70 Help", taskDesc: "HELP MEEE IM DYING", taskLikes: 5, userPosted: "Ryan Richards", status: "inactive", expires: self.date, location: MKCoordinateRegion(center: self.center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))),
        
            Task(taskName: "i need an umbrella", taskDesc: "it's raining and i have no umbrella. i'm near soda. ", taskLikes: 10, userPosted: "Cal Wilmott", status: "active", expires: self.date, location: MKCoordinateRegion(center: self.losAngeles, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))),
                
            Task(taskName: "Get me Chipotle", taskDesc: "If you're nearby or something just get me a burrito bowl please thanks.", taskLikes: 484, userPosted: "Jill McAdams", status: "active", expires: self.date, location: MKCoordinateRegion(center: self.paloAlto, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))),
                
            Task(taskName: "Need a ride to class", taskDesc: "anyone have a car?", taskLikes: 10, userPosted: "Jane Austin", status: "active", expires: self.date, location: MKCoordinateRegion(center: self.china, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
        ]
        
        
        let ploopTask = Task(taskName: "I need help with IOS RIPME", taskDesc: "This is due tonight i hate life", taskLikes: 9001, userPosted: "Nerissa Lin", status: "completed", expires: NSDate(timeInterval: -3600, sinceDate: NSDate()), location: MKCoordinateRegion(center: self.china, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
        
        People.peopleDatabase.setValue(User(username: "Ryan Richards", rating: 4.5, requestedTasks: [People.exampleFeed[0]], acceptedTasks: [ploopTask]), forKey: "Ryan Richards")
        People.peopleDatabase.setValue(User(username: "Cal Wilmott", rating: 3.0, requestedTasks: [People.exampleFeed[1]], acceptedTasks: [ploopTask]), forKey: "Cal Wilmott")
        People.peopleDatabase.setValue(User(username: "Jill McAdams", rating: 4.1, requestedTasks: [People.exampleFeed[2]], acceptedTasks: [ploopTask]), forKey: "Jill McAdams")
        People.peopleDatabase.setValue(User(username: "Jane Austin", rating: 4.7, requestedTasks: [People.exampleFeed[3]], acceptedTasks: [ploopTask]), forKey: "Jane Austin")
        People.peopleDatabase.setValue(User(username: "Nerissa Lin", rating: 6.9, requestedTasks: [ploopTask], acceptedTasks: []), forKey: "Nerissa Lin")
        
        People.me = User(username: "YJ Kim", rating: 5.0, requestedTasks: [], acceptedTasks: [])
        People.peopleDatabase.setValue(People.me, forKey: "YJ Kim")
        
        
        
    }
    
    static func addTask(task: Task){
        People.exampleFeed.append(task)
        let postingUser = People.peopleDatabase.valueForKey(task.userPosted) as! User
        postingUser.requestedTasks.append(task)
        People.peopleDatabase.setValue(postingUser, forKey: task.userPosted)
    }
    
    
}