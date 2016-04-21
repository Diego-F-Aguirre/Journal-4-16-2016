//
//  EntryController.swift
//  Journal_4-16-2016
//
//  Created by Diego Aguirre on 4/16/16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation

class EntryController {
    static let sharedInstance = EntryController()
    private let kEntries = "entries"
    let userDefualts = NSUserDefaults.standardUserDefaults()
    var entryArray: [Entry] = []
    
    init() {
        self.loadFromPersistentStorage()
    }
}

extension EntryController {
    func createEntry(title: String, body: String, date: NSDate) {
        let newEntry = Entry(title: title, body: body, date: date)
        entryArray.append(newEntry)
        self.saveToPersistentStorage()
    }
    
    func updateEntry(entry: Entry, newTitle: String, newBody: String, newDate: NSDate) {
        if entry == entry {
            entry.title = newTitle
            entry.body = newBody
            entry.date = newDate
            self.saveToPersistentStorage()
        }
    }
    
    func removeEntry(entry: Entry) {
        if let entryIndex = entryArray.indexOf(entry) {
            entryArray.removeAtIndex(entryIndex)
            self.saveToPersistentStorage()
        }
    }
}

extension EntryController {
    func saveToPersistentStorage() {
        var entryDictionaryArray: [[String: AnyObject]] = []
        
        for entry in entryArray {
            let entryDictionary = entry.dictionaryCopy
            entryDictionaryArray.append(entryDictionary)
            userDefualts.setObject(entryDictionaryArray, forKey: kEntries)
        }
    }
    
    func loadFromPersistentStorage() {
        guard let entryDictionaries = userDefualts.objectForKey(kEntries) as? [[String: AnyObject]] else { return }
        
        var entries: [Entry] = []
        
        for entryDictionary in entryDictionaries {
            if let entry = Entry(dictionary: entryDictionary) {
                entries.append(entry)
            }
        }
        entryArray = entries
    }
}


