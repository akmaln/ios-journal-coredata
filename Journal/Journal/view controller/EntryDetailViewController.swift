//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Akmal Nurmatov on 5/19/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var moodController: UISegmentedControl!
    
    var entry: Entry?
    var wasEdited: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setRightBarButton(editButtonItem, animated: false)
        
        updateViews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if wasEdited {
            guard let title = titleTextField.text,
                let entry = entry else { return }
            
            entry.title = title
            entry.bodyText = bodyTextView.text
            let moodIndex = moodController.selectedSegmentIndex
            entry.mood = Mood.allCases[moodIndex].rawValue
            
            do {
                try CoreDataStack.shared.mainContext.save()
                navigationItem.hidesBackButton = false
            } catch {
                NSLog("error saving managed object context: \(error)")
            }
        }
    }
            

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        if editing == true { wasEdited = true }
            titleTextField.isUserInteractionEnabled = editing
            bodyTextView.isUserInteractionEnabled = editing
            moodController.isUserInteractionEnabled = editing
            navigationItem.hidesBackButton = editing
        
    }

    func updateViews() {
        guard let entry = entry else { return }
        
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodyText
        let mood: Mood

        if let moodPriority = entry.mood {
            mood = Mood(rawValue: moodPriority)!
        } else {
            mood = .neutral
        }
        moodController.selectedSegmentIndex = Mood.allCases.firstIndex(of: mood) ?? 1

        moodController.isUserInteractionEnabled = isEditing
        titleTextField.isUserInteractionEnabled = isEditing
        bodyTextView.isUserInteractionEnabled = isEditing
    }

}


