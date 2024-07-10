//
//  AccountModel.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct Account: Identifiable, Equatable, Codable {
    var name: String?
    var accounts: [Login]?
    let creationDate: Date
    var updatedDate: Date?
    var markedForDeletionDate: Date?
    var starred: Bool
    var showInAutofill: Bool
    let id: UUID
    
    static func == (lhs: Account, rhs: Account) -> Bool {
        lhs.id == rhs.id
    }
    
    init(
        name: String? = nil,
        accounts: [Login]? = nil,
        creationDate: Date = Date(),
        updatedDate: Date? = nil,
        markedForDeletionDate: Date? = nil,
        starred: Bool = false,
        showInAutofill: Bool = false,
        id: UUID = UUID()
    ) {
        self.name = name
        self.accounts = accounts
        self.creationDate = creationDate
        self.updatedDate = updatedDate
        self.markedForDeletionDate = markedForDeletionDate
        self.starred = starred
        self.showInAutofill = showInAutofill
        self.id = id
    }
}
