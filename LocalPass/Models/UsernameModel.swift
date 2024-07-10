//
//  UsernameModel.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct Username: Equatable, Codable {
    var name: String
    let creationDate: Date
    var updatedDate: Date?
    var markedForDeletionDate: Date?
    
    static func == (lhs: Username, rhs: Username) -> Bool {
        lhs.name == rhs.name
    }
    
    init(
        name: String,
        creationDate: Date = Date(),
        updatedDate: Date? = nil,
        markedForDeletionDate: Date? = nil
    ) {
        self.name = name
        self.creationDate = creationDate
        self.updatedDate = updatedDate
        self.markedForDeletionDate = markedForDeletionDate
    }
}
