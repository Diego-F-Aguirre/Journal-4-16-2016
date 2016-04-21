//
//  Entry.swift
//  Journal_4-16-2016
//
//  Created by Diego Aguirre on 4/21/16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation
import CoreData


class Entry: NSManagedObject {
    
    static let kClassName = "Entry"

// Insert code here to add functionality to your managed object subclass
    
    convenience init?(title: String, bodyText: String, timeStamp: NSDate, journal: Journal, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        guard let entity = NSEntityDescription.entityForName(Entry.kClassName, inManagedObjectContext: context) else { return nil }
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        self.title = title
        self.bodyText = bodyText
        self.timeStamp = timeStamp
        self.journal = journal
    }

}
