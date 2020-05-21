//
//  Entry+Convenience.swift
//  Journal
//
//  Created by Akmal Nurmatov on 5/18/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import Foundation
import CoreData

enum Mood: String, CaseIterable {
    case happy
    case neutral
    case sad
}

extension Entry {
    
    var entryRepresentation: EntryRepresentation? {
        guard let id = identifier,
            let title = title,
            let mood = mood,
            let bodyText = bodyText,
            let timestamp = timestamp else {
                return nil
        }
        
        return EntryRepresentation(bodyText: bodyText, identifier: id, mood: mood, timestamp: timestamp, title: title)
            
    }
    
    @discardableResult convenience init(title: String,
                                        bodyText: String,
                                        timestamp: Date? = Date(),
                                        identifier: String = "",
                                        mood: Mood = .neutral,
                                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext){
        self.init(context : context)
        self.title = title
        self.identifier = identifier
        self.bodyText = bodyText
        self.timestamp = timestamp
        self.mood = mood.rawValue
    }
    
    @discardableResult convenience init?(entryRepresentation: EntryRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        guard let mood = Mood(rawValue: entryRepresentation.mood) else { return nil }
        
        self.init(title: entryRepresentation.title, bodyText: entryRepresentation.bodyText, timestamp: entryRepresentation.timestamp, identifier: entryRepresentation.identifier, mood: mood, context: context)
    }
}























