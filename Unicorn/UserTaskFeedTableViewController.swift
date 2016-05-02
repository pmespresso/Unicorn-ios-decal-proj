//
//  UserTaskFeedTableViewController.swift
//  Unicorn
//
//  Created by Nicole Rasquinha on 5/2/16.
//  Copyright © 2016 Nicole Rasquinha. All rights reserved.
//

import UIKit

class UserTaskFeedTableViewController: UITableViewController {
    
    private let reuseIdentifier = "TaskCell"
    var tasks: [Task]!
    var user: User!
    
    @IBOutlet var taskFeedTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        taskFeedTable.delegate = self
        taskFeedTable.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = taskFeedTable.dequeueReusableCellWithIdentifier("TaskCell", forIndexPath: indexPath) as! TaskViewCell
        
        let task = tasks[indexPath.row]
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let expiry = dateFormatter.stringFromDate(task.expires)
        
        cell.taskTitleLabel?.text = task.taskName
        cell.taskDescriptionLabel?.text = task.taskDesc
        cell.expiresInLabel.text =  "Expires at: " + expiry
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationNavigationController = segue.destinationViewController as! UINavigationController
        let targetController = destinationNavigationController.topViewController as! UserProfileViewController
        targetController.profileName = user.username
    }

}
