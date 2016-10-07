//
//  TaskDetailTableViewController.swift
//  TaskAsMentor
//
//  Created by Jeff Norton on 10/6/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    //==================================================
    // MARK: - Properties
    //==================================================

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var notesTextField: UITextField!
    
    var task: Task?
    var dueDateValue: NSDate?
    
    //==================================================
    // MARK: - General
    //==================================================

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dueDateTextField.inputView = dueDatePicker

        if let task = task {
            
            updateWith(task: task)
        }
    }
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    func updateWith(task: Task) {
        
        nameTextField.text = task.name
        dueDateTextField.text = task.dueDate?.stringValue()
        notesTextField.text = task.notes
    }

    //==================================================
    // MARK: - Actions
    //==================================================
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        dueDateTextField.text = ""
        self.dueDateValue = sender.date as NSDate?
        dueDateTextField.text = self.dueDateValue?.stringValue()
    }
    
    @IBAction func userTappedView() {
        
        nameTextField.resignFirstResponder()
        dueDateTextField.resignFirstResponder()
        notesTextField.resignFirstResponder()
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        
        guard let name = nameTextField.text,
            let notes = notesTextField.text
            else { return }
        
        if let task = task {
            
            // Update existing task
            TaskController.shared.updateTask(task: task, name: name, notes: notes, dueDate: dueDateValue, isComplete: false)
            
        } else {
            
            // Create new task
            TaskController.shared.addTask(name: name, notes: notes, dueDate: dueDateValue)
        }
        
        navigationController?.popViewController(animated: true)
    }
}
















