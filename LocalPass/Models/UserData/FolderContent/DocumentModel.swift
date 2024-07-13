//
//  DocumentModel.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct Document: FolderContent {
    var name: String?
    var number: String?
    var expirationMonth: String?
    var expirationYear: String?
    var updatedDate: Date?
    var markedForDeletionDate: Date?
    var starred: Bool
    
    let creationDate: Date
    let id: UUID
    
    init(
        name: String? = nil,
        number: String? = nil,
        expirationMonth: String? = nil,
        expirationYear: String? = nil
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
