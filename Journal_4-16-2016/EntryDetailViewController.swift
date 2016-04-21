//
//  EntryDetailViewController.swift
//  Journal_4-16-2016
//
//  Created by Diego Aguirre on 4/16/16.
//  Copyright © 2016 home. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let entry = entry else { return }
        
        self.updateViewWithEntry(entry)
    }
}

extension EntryDetailViewController {
    func updateViewWithEntry(entry: Entry) {
        if let entry = self.entry {
            titleTextField.text = entry.title
            bodyTextView.text = entry.body
            
            //            let currentDate = NSDate()
            //            let dateFormatter = NSDateFormatter()
            //            dateFormatter.dateFormat = "EEE, MM/dd/yy"
            //            let date = dateFormatter.stringFromDate(currentDate)
            //
            //            entry.date = date
            //            EntryController.sharedInstance.entryArray.append(entry)
            //            EntryController.sharedInstance.saveToPersistentStorage()
        }
    }
}

extension EntryDetailViewController {
    @IBAction func clearButtonPressed(sender: AnyObject) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        
        guard let title = titleTextField.text,
            body = bodyTextView.text else  { return }
        
        if title != "" && body != "" {
            if let entry = entry {
                EntryController.sharedInstance.updateEntry(entry, newTitle: title, newBody: body, newDate: NSDate())
            } else {
                EntryController.sharedInstance.createEntry(title, body: body, date: NSDate())
            }
            navigationController?.popViewControllerAnimated(true)
        }
        
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
}

extension EntryDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return titleTextField.resignFirstResponder()
    }
}

extension EntryDetailViewController: UITextViewDelegate {
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}
