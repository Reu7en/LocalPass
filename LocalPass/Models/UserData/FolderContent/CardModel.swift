//
//  CardModel.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct Card: FolderContent {
    var name: String?
    var holder: String?
    var number: String?
    var expirationMonth: Int?
    var expirationYear: Int?
    var securityCode: Int?
    var notes: [String]?
    var updatedDate: Date?
    var markedForDeletionDate: Date?
    var starred: Bool
    var showInAutofill: Bool
    
    let creationDate: Date
    let id: UUID
    
    init(
        name: String? = nil,
        holder: String? = nil,
        number: String? = nil,
        expirationMonth: Int? = nil,
        expirationYear: Int? = nil,
        securityCode: Int? = nil,
        notes: [String]? = nil,
        showInAutofill: Bool = false
    ) {
        self.name = name
        self.holder = holder
        self.number = number
        self.expirationMonth = expirationMonth
        self.expirationYear = expirationYear
        self.securityCode = securityCode
        self.notes = notes
        self.updatedDate = nil
        self.markedForDeletionDate = nil
        self.starred = false
        self.showInAutofill = showInAutofill
        
        self.creationDate = Date()
        self.id = UUID()
    }
}
