//
//  Username.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct Username: SupportingContent {
    var name: String
    var updatedDate: Date?
    var markedForDeletionDate: Date?
    
    let creationDate: Date
    
    static func == (lhs: Username, rhs: Username) -> Bool {
        lhs.name == rhs.name
    }
    
    init(
        name: String
    ) {
        self.name = name
        self.updatedDate = nil
        self.markedForDeletionDate = nil
        
        self.creationDate = Date()
    }
}
