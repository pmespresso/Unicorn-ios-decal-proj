//
//  TaskViewCell.swift
//  Unicorn
//
//  Created by Young Joong Kim on 4/23/16.
//  Copyright © 2016 Nicole Rasquinha. All rights reserved.
//

import UIKit
import Foundation

class TaskViewCell:UITableViewCell {
    @IBOutlet weak var taskTitleLabel: UILabel!
    
    @IBOutlet weak var likesCount: UILabel!
    @IBOutlet weak var taskDescriptionLabel: UILabel!
    @IBOutlet weak var expiresInLabel: UILabel!
    var likes:Int = 0
    var liked:Bool = false
    
    
    @IBAction func upvoteButton(sender: AnyObject) {
        if liked == false {
            likes = likes + 1
            likesCount.text = String(likes)
            liked = true
            upvoteButton.setTitle("Unlike", forState: .Normal)
        } else {
            likes = likes - 1
            likesCount.text = String(likes)
            liked = false
            upvoteButton.setTitle("Like", forState: .Normal)
        }
    }
    
    @IBOutlet weak var upvoteButton: UIButton!
  
    
    
    
}

