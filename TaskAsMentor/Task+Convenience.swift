//
//  Task+Convenience.swift
//  TaskAsMentor
//
//  Created by Jeff Norton on 10/6/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    //==================================================
    // MARK: - Initializer
    //==================================================
    
    convenience init(name: String, notes: String?, dueDate: NSDate?, isComplete: Bool = false, context: NSManagedObjectContext = Stack.context) {
        
        self.init(context: context)
        
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = isComplete
    }
}
