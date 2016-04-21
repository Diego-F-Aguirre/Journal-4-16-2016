//
//  Journal+CoreDataProperties.swift
//  Journal_4-16-2016
//
//  Created by Diego Aguirre on 4/21/16.
//  Copyright © 2016 home. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Journal {

    @NSManaged var title: String?
    @NSManaged var entries: NSOrderedSet?

}
