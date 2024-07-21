//
//  LoginModel.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct Login: Content {
    var name: String?
    var username: Username?
    var password: String?
    var urls: [URL]?
    var totpKey: String?
    var backupCodes: [String]?
    var notes: [String]?
    var showInAutofill: Bool
    var starred: Bool
    var updatedDate: Date?
    var passwordUpdatedDate: Date?
    var markedForDeletionDate: Date?
    
    let creationDate: Date
    let id: UUID
    
    init(
        name: String? = nil,
        username: Username? = nil,
        password: String? = nil, 
        urlStrings: [String]? = nil,
        totpKey: String? = nil,
        backupCodes: [String]? = nil,
        notes: [String]? = nil,
        showInAutofill: Bool = false
    ) {
        self.name = name
        self.username = username
        self.password = password
        self.urls = urlStrings?.compactMap { URLValidator.validate(urlString: $0) }
        self.totpKey = totpKey
        self.backupCodes = backupCodes
        self.notes = notes
        self.showInAutofill = showInAutofill
        self.starred = false
        self.updatedDate = nil
        self.passwordUpdatedDate = nil
        self.markedForDeletionDate = nil
        
        self.creationDate = Date()
        self.id = UUID()
    }
}
