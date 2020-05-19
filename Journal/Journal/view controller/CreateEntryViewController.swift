//
//  ViewController.swift
//  Journal
//
//  Created by Akmal Nurmatov on 5/18/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import UIKit

class CreateEntryViewController: UIViewController {

    @IBOutlet weak var bodyTextField: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func save(_ sender: UIBarButtonItem) {

        guard let title = titleTextField.text,
            !title.isEmpty else { return }

        guard let body = bodyTextField.text,
            !body.isEmpty else { return }

        Entry(title: title, bodyText: body)

        do {
            try CoreDataStack.shared.mainContext.save()

        } catch {
            NSLog("error saving managed object context: \(error)")
            return
        }

        navigationController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true, completion: nil)
    }

}
