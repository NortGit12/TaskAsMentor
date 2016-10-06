//
//  TaskListTableViewController.swift
//  TaskAsMentor
//
//  Created by Jeff Norton on 10/6/16.
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
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TaskController.shared.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskListCell", for: indexPath) as? TaskListCell
            else { return UITableViewCell() }

        let task = TaskController.shared.tasks[indexPath.row]
        cell.updateWith(task: task)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let task = TaskController.shared.tasks[indexPath.row]
            TaskController.shared.remove(task: task)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        /*
        else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        */
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

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
