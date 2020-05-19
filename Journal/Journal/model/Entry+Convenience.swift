//
//  Entry+Convenience.swift
//  Journal
//
//  Created by Akmal Nurmatov on 5/18/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import Foundation
import CoreData

extension Entry {
    @discardableResult convenience init(title: String,
                                        bodyText: String,
                                        timestamp: Date? = Date(),
                                        identifier: String = "",
                                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext){
        self.init(context : context)
        self.title = title
        self.identifier = identifier
        self.bodyText = bodyText
        self.timestamp = timestamp

    }
}
