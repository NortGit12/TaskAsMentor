//
//  Stack.swift
//  TaskAsMentor
//
//  Created by Jeff Norton on 10/6/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import Foundation

import CoreData

class Stack {
    
    static let container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "TaskAsMentor")
        container.loadPersistentStores() { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        return container
    }()
    
    static var context: NSManagedObjectContext { return container.viewContext }
}
