//
//  TaskFeedTableViewController.swift
//  Unicorn
//
//  Created by Nicole Rasquinha on 4/23/16.
//  Copyright © 2016 Nicole Rasquinha. All rights reserved.
//

import UIKit

class TaskFeedTableViewController: UITableViewController {
    var tasks:[Task!]! = []
    var task:Task!
    var people:People! = People()
    
    @IBOutlet var myProfile: UIBarButtonItem!
    private let reuseIdentifier = "TaskCell"
    
    @IBOutlet weak var taskFeedTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        taskFeedTable.delegate = self
        taskFeedTable.dataSource = self
        for i in people.exampleFeed {
            tasks.append(i)
        }
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
        
        self.task = tasks[indexPath.row]
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let expiry = dateFormatter.stringFromDate(self.task.expires)

        cell.taskTitleLabel?.text = task.taskName
        cell.taskDescriptionLabel?.text = task.taskDesc
        cell.likesCount.text = String(task.taskLikes)
        cell.expiresInLabel.text =  "Expires at: " + expiry
        cell.likes = task.taskLikes
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "TaskDetailSegue" {
            let cell = sender as! UITableViewCell
            let indexPath = taskFeedTable.indexPathForCell(cell)
            
            self.task = tasks[indexPath!.row]
            let destViewController: TaskDetailViewController = segue.destinationViewController as! TaskDetailViewController
            destViewController.nameDetail = task.taskName
            destViewController.descriptionDetail = task.taskDesc
            destViewController.userPosted = task.userPosted
            destViewController.likesDetail = task.taskLikes
            destViewController.location = task.location
            destViewController.expiresIn = task.expires
        }
        
        
    }


}

