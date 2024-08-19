//
//  Document.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct Document: Content {
    var name: String?
    var number: String?
    var expirationMonth: Int?
    var expirationYear: Int?
    var updatedDate: Date?
    var markedForDeletionDate: Date?
    var starred: Bool
    
    let creationDate: Date
    let id: UUID
    
    init(
        name: String? = nil,
        number: String? = nil,
        expirationMonth: Int? = nil,
        expirationYear: Int? = nil
    ) {
        self.name = name
        self.number = number
        self.expirationMonth = expirationMonth
        self.expirationYear = expirationYear
        self.updatedDate = nil
        self.markedForDeletionDate = nil
        self.starred = false
        
        self.creationDate = Date()
        self.id = UUID()
    }
}
