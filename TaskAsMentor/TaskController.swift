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
    
    var mockTasks: [Task] {
        
        let task01 = Task(name: "Task01", notes: nil, dueDate: nil)
        let task02 = Task(name: "Task02", notes: "notes stuff", dueDate: Date(), isComplete: true)
        let task03 = Task(name: "Task03", notes: ":)", dueDate: nil)
        let task04 = Task(name: "Task04", notes: nil, dueDate: Date())
        
        return [task01, task02, task03, task04]
    }
    
    //==================================================
    // MARK: - Initializer
    //==================================================
    
    init() {
        
        self.tasks = fetchTasks()
    }
    
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
        
        return mockTasks
    }
}


























