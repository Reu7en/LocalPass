//
//  Account.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct Account: FolderContent {
    var name: String?
    var logins: [Login]?
    var updatedDate: Date?
    var markedForDeletionDate: Date?
    var starred: Bool
    var showInAutofill: Bool
    
    let creationDate: Date
    let id: UUID
    
    init(
        name: String? = nil,
        logins: [Login]? = nil,
        showInAutofill: Bool = false
    ) {
        self.name = name
        self.logins = logins
        self.updatedDate = nil
        self.markedForDeletionDate = nil
        self.starred = false
        self.showInAutofill = showInAutofill
        
        self.creationDate = Date()
        self.id = UUID()
    }
}
