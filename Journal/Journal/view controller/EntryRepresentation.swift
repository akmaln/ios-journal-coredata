//
//  EntryRepresentation.swift
//  Journal
//
//  Created by Akmal Nurmatov on 5/20/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import Foundation

struct EntryRepresentation: Codable {
    let bodyText: String
    let identifier: String
    let mood: String
    let timestamp: Date
    let title: String
}
