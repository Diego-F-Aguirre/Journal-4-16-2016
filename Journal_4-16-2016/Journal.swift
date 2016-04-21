//
//  Journal.swift
//  Journal_4-16-2016
//
//  Created by Diego Aguirre on 4/21/16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation
import CoreData


class Journal: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    static let kClassName = "Journal"
    
    convenience init?(title: String, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        guard let entity = NSEntityDescription.entityForName(Journal.kClassName, inManagedObjectContext: context) else { return nil }
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        self.title = title
    }

}
