//
//  TaskController.swift
//  TaskAsMentor
//
//  Created by Jeff Norton on 10/6/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    //==================================================
    // MARK: - Properties
    //==================================================
    
    static let shared = TaskController()
    
    var mockTasks: [Task] {
        
        let task01 = Task(name: "Task01", notes: nil, dueDate: nil)
        let task02 = Task(name: "Task02", notes: "notes stuff", dueDate: NSDate(), isComplete: true)
        let task03 = Task(name: "Task03", notes: ":)", dueDate: nil)
        let task04 = Task(name: "Task04", notes: nil, dueDate: NSDate())
        
        return [task01, task02, task03, task04]
    }
    
    //==================================================
    // MARK: - Initializer
    //==================================================
    
    init() {
        
        
    }
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    func addTask(name: String, notes: String?, dueDate: NSDate?) {
        
        let _ = Task(name: name, notes: notes, dueDate: dueDate)
        
        saveToPersistentStore()
        
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            
            self.tasks = try Stack.context.fetch(request)
            
        } catch {
            
            NSLog("Error fetching tasks: \(error.localizedDescription)")
        }
    }
    
    func remove(task: Task) {
        
        task.managedObjectContext?.delete(task)
        
        saveToPersistentStore()
        
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            
            self.tasks = try Stack.context.fetch(request)
            
        } catch {
            
            NSLog("Error fetching tasks: \(error.localizedDescription)")
        }

    }
    
    func updateTask(task: Task, name: String, notes: String?, dueDate: NSDate?, isComplete: Bool?) {
        
        
    }
    
    //==================================================
    // MARK: - Persistence
    //==================================================
    
    func saveToPersistentStore() {
        
        do {
            try Stack.context.save()
        } catch {
            NSLog("Error saving the ManagedObjectContext: \(error.localizedDescription)")
        }
    }
}


























