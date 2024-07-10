//
//  EmailModel.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct Email: Equatable, Codable {
    var address: String
    let creationDate: Date
    var updatedDate: Date?
    var markedForDeletionDate: Date?
    
    static func == (lhs: Email, rhs: Email) -> Bool {
        lhs.address == rhs.address
    }
    
    init(
        address: String,
        creationDate: Date = Date(),
        updatedDate: Date? = nil,
        markedForDeletionDate: Date? = nil
    ) {
        self.address = address
        self.creationDate = creationDate
        self.updatedDate = updatedDate
        self.markedForDeletionDate = markedForDeletionDate
    }
}
