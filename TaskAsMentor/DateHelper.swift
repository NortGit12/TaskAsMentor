//
//  DateHelper.swift
//  TaskAsMentor
//
//  Created by Jeff Norton on 10/6/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import Foundation
import CoreData

extension NSDate {
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self as Date)
    }
}
