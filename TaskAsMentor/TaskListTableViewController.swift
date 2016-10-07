//
//  TaskListTableViewController.swift
//  TaskAsMentor
//
//  Created by Jeff Norton on 10/7/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    //==================================================
    // MARK: - Properties
    //==================================================
    
    
    
    //==================================================
    // MARK: - General
    //==================================================

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    //==================================================
    // MARK: - Table view data source
    //==================================================

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        guard let sections = TaskController.shared.fetchedResultsController.sections else {
            fatalError("Error: No sections in the fetchedResutlsController.")
        }
        
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        guard let sections = TaskController.shared.fetchedResultsController.sections
            , let sectionNameAsInt = Int(sections[section].name)
            else { return nil }
        
        switch sectionNameAsInt {
        case 0: return "Incomplete"
        case 1: return "Completed"
        default: return "Unknown"
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let sections = TaskController.shared.fetchedResultsController.sections else {
            fatalError("Error: No sections in the fetchedResutlsController.")
        }
        
        let sectionInfo = sections[section]
        
        return sectionInfo.numberOfObjects
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskListCell", for: indexPath) as? ButtonTableViewCell
            , let tasks = TaskController.shared.fetchedResultsController.fetchedObjects
            else { return UITableViewCell() }

        let task = tasks[indexPath.row]
        
        cell.updateWith(task: task)

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            guard let indexPath = tableView.indexPathForSelectedRow,
                let tasks = TaskController.shared.fetchedResultsController.fetchedObjects
                else { return }
            TaskController.shared.remove(task: tasks[indexPath.row])
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    //==================================================
    // MARK: - Navigation
    //==================================================
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "fromCellToExisting" {
            
            if let taskDetailTableViewController = segue.destination as? TaskDetailTableViewController {
                
                if let index = tableView.indexPathForSelectedRow?.row,
                    let tasks = TaskController.shared.fetchedResultsController.fetchedObjects {
                
                    taskDetailTableViewController.task = tasks[index]
                }
            }
        }
    }

}

























