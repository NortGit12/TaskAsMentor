//
//  TaskListCell.swift
//  TaskAsMentor
//
//  Created by Jeff Norton on 10/6/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import UIKit

class TaskListCell: UITableViewCell {
    
    //==================================================
    // MARK: - Properties
    //==================================================
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var isCompleteImageView: UIImageView!
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    func updateWith(task: Task) {
        
        nameLabel.text = task.name
        
    }
}
