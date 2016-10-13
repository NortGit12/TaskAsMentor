//
//  TaskListTableViewController.swift
//  TaskAsMentor
//
//  Created by Jeff Norton on 10/7/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import UIKit
import CoreData

class TaskListTableViewController: UITableViewController, NSFetchedResultsControllerDelegate, ButtonTableViewCellDelegate {
    
    //==================================================
    // MARK: - General
    //==================================================

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TaskController.shared.fetchedResultsController.delegate = self
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
            else { return UITableViewCell() }
        
        cell.delegate = self

        let task = TaskController.shared.fetchedResultsController.object(at: indexPath)
        
        cell.updateWith(task: task)

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let task = TaskController.shared.fetchedResultsController.object(at: indexPath)
            
            TaskController.shared.remove(task: task)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //==================================================
    // MARK: - ButtonTableViewCellDelegate
    //==================================================
    
    func buttonCellButtonTapped(sender: ButtonTableViewCell) {
        
        guard let indexPath = tableView.indexPath(for: sender) else { return }
        
        let task = TaskController.shared.fetchedResultsController.object(at: indexPath)
        TaskController.shared.toggleIsCompleted(task: task)
    }
    
    //==================================================
    // MARK: - NSFetchedResultsControllerDelegate
    //==================================================
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
            
        case .delete:
            guard let indexPath = indexPath else { return }
            tableView.deleteRows(at: [indexPath], with: .fade)
        case .insert:
            guard let newIndexPath = newIndexPath else { return }
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        case .move:
            guard let indexPath = indexPath,
                let newIndexPath = newIndexPath
                else { return }
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        case .update:
            guard let indexPath = indexPath,
                let newIndexPath = newIndexPath
                else { return }
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        
        switch type {
            
        case .delete:
            tableView.deleteSections(NSIndexSet(index: sectionIndex) as IndexSet, with: .automatic)
        case .insert:
            tableView.insertSections(NSIndexSet(index: sectionIndex) as IndexSet, with: .automatic)
        default:
            break
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.endUpdates()
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

























