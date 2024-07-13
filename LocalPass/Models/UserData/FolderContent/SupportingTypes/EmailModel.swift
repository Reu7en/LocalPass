//
//  EmailModel.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct Email: Equatable, Codable {
    var address: String
    var updatedDate: Date?
    var markedForDeletionDate: Date?
    
    let creationDate: Date
    
    static func == (lhs: Email, rhs: Email) -> Bool {
        lhs.address == rhs.address
    }
    
    init(
        address: String
    ) {
        self.address = address
        self.updatedDate = nil
        self.markedForDeletionDate = nil
        
        self.creationDate = Date()
    }
}
