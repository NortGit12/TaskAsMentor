//
//  TaskListCell.swift
//  TaskAsMentor
//
//  Created by Jeff Norton on 10/6/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    //==================================================
    // MARK: - Properties
    //==================================================
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var isCompleteButton: UIButton!
    
    var delegate: ButtonTableViewCellDelegate?
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    func updateButton(isComplete: Bool) {
        
        if isComplete == true {
            
            isCompleteButton.imageView?.image = UIImage(named: "complete")
            
        } else {
            
            isCompleteButton.imageView?.image = UIImage(named: "incomplete")
            
        }
    }
    
    //==================================================
    // MARK: - Action
    //==================================================
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if delegate != nil {
            delegate?.buttonCellButtonTapped(sender: self)
        }
    }
}

extension ButtonTableViewCell {
    
    func updateWith(task: Task) {
        
        nameLabel.text = task.name
        updateButton(isComplete: task.isComplete)
        
    }
}


protocol ButtonTableViewCellDelegate {
    
    func buttonCellButtonTapped(sender: ButtonTableViewCell)
}



























