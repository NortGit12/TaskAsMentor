//
//  TaskListTableViewController.swift
//  TaskAsMentor
//
//  Created by Jeff Norton on 10/6/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController, ButtonTableViewCellDelegate {
    
    //==================================================
    // MARK: - Properties
    //==================================================
    
    
    
    //==================================================
    // MARK: - General
    //==================================================

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    //==================================================
    // MARK: - Table view data source
    //==================================================

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TaskController.shared.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskListCell", for: indexPath) as? ButtonTableViewCell
            else { return UITableViewCell() }
        
        cell.delegate = self

        let task = TaskController.shared.tasks[indexPath.row]
        cell.updateWith(task: task)

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let task = TaskController.shared.tasks[indexPath.row]
            TaskController.shared.remove(task: task)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //==================================================
    // MARK: - ButtonTableViewCellDelegate
    //==================================================
    
    func buttonCellButtonTapped(sender: ButtonTableViewCell) {
        
        guard let index = tableView.indexPathForSelectedRow?.row else { return }
        
        let task = TaskController.shared.tasks[index]
        task.isComplete = !task.isComplete
        
        TaskController.shared.saveToPersistentStore()
        
        tableView.reloadData()
    }

    //==================================================
    // MARK: - Navigation
    //==================================================

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "fromCellToExisting" {
            
            if let taskDetailTableViewController = segue.destination as? TaskDetailTableViewController,
                let index = tableView.indexPathForSelectedRow?.row {
                
                let task = TaskController.shared.tasks[index]
                
                taskDetailTableViewController.task = task
            }
        }
    }

}
