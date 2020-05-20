//
//  EntryTableViewCell.swift
//  Journal
//
//  Created by Akmal Nurmatov on 5/18/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
    
    static let reuseIdentifier = "EntryCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bodyTextLabel: UILabel!
    
    private func updateViews() {
        guard let entry = entry else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YY, hh:mm"
        let currentTime = dateFormatter.string(from: entry.timestamp!)
        
        titleLabel.text = entry.title
        dateLabel.text = currentTime
        bodyTextLabel.text = entry.bodyText
    }
    

}
