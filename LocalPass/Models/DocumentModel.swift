//
//  DocumentModel.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct Document: Identifiable, Equatable, Codable {
    var name: String?
    var number: String?
    var expirationMonth: String?
    var expirationYear: String?
    let creationDate: Date
    var updatedDate: Date?
    var markedForDeletionDate: Date?
    var starred: Bool
    let id: UUID
    
    static func == (lhs: Document, rhs: Document) -> Bool {
        lhs.id == rhs.id
    }
    
    init(
        name: String? = nil,
        number: String? = nil,
        expirationMonth: String? = nil,
        expirationYear: String? = nil,
        creationDate: Date = Date(),
        updatedDate: Date? = nil,
        markedForDeletionDate: Date? = nil,
        starred: Bool = false,
        id: UUID = UUID()
    ) {
        self.name = name
        self.number = number
        self.expirationMonth = expirationMonth
        self.expirationYear = expirationYear
        self.creationDate = creationDate
        self.updatedDate = updatedDate
        self.markedForDeletionDate = markedForDeletionDate
        self.starred = starred
        self.id = id
    }
}
