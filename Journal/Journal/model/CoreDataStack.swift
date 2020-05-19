//
//  CoreDataStack.swift
//  Journal
//
//  Created by Akmal Nurmatov on 5/18/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Entries")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("failed to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
}
