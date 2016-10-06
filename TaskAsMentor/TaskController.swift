//
//  TaskController.swift
//  TaskAsMentor
//
//  Created by Jeff Norton on 10/6/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import Foundation

class TaskController {
    
    //==================================================
    // MARK: - Properties
    //==================================================
    
    static let shared = TaskController()
    var tasks = [Task]()
    
    var completedTasks: [Task] {
        
        return tasks.filter({ $0.isComplete == true })
    }
    
    var incompleteTasks: [Task] {
        
        return tasks.filter({ $0.isComplete == false })
    }
    
    //==================================================
    // MARK: - Initializer
    //==================================================
    
    
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    func addTask(name: String, notes: String?, dueDate: NSDate?) {
        
        
    }
    
    func remove(task: Task) {
        
        
    }
    
    func updateTask(task: Task, name: String, notes: String?, dueDate: NSDate?, isComplete: Bool?) {
        
        
    }
    
    //==================================================
    // MARK: - Persistence
    //==================================================
    
    func saveToPersistentStore() {
        
        
    }
    
    //==================================================
    // MARK: - Mock Data
    //==================================================
    
    func fetchTasks() -> [Task] {
        
        
    }
}


























