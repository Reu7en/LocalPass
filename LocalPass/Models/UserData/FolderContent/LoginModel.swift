//
//  LoginModel.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct Login: FolderContent {
    var name: String?
    var username: Username?
    var password: String?
    var urls: [URL]?
    var otpKey: String?
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
        urls: [URL]? = nil,
        otpKey: String? = nil,
        backupCodes: [String]? = nil,
        notes: [String]? = nil,
        showInAutofill: Bool = false
    ) {
        self.name = name
        self.username = username
        self.password = password
        self.urls = urls
        self.otpKey = otpKey
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
