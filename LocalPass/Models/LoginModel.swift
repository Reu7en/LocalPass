//
//  LoginModel.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct Login: Identifiable, Equatable, Codable {
    var name: String?
    var username: Username?
    var password: String?
    var urls: [URL]?
    var otpKey: String?
    var backupCodes: [String]?
    var notes: [String]?
    let creationDate: Date
    var updatedDate: Date?
    var passwordUpdatedDate: Date?
    var markedForDeletionDate: Date?
    var starred: Bool
    var showInAutofill: Bool
    let id: UUID
    
    static func == (lhs: Login, rhs: Login) -> Bool {
        lhs.id == rhs.id
    }
    
    init(
        name: String? = nil,
        username: Username? = nil,
        password: String? = nil, 
        urls: [URL]? = nil,
        otpKey: String? = nil,
        backupCodes: [String]? = nil,
        notes: [String]? = nil,
        creationDate: Date = Date(),
        updatedDate: Date? = nil,
        passwordUpdatedDate: Date? = nil,
        markedForDeletionDate: Date? = nil,
        starred: Bool = false,
        showInAutofill: Bool = false,
        id: UUID = UUID()
    ) {
        self.name = name
        self.username = username
        self.password = password
        self.urls = urls
        self.otpKey = otpKey
        self.backupCodes = backupCodes
        self.notes = notes
        self.creationDate = creationDate
        self.updatedDate = updatedDate
        self.passwordUpdatedDate = passwordUpdatedDate
        self.markedForDeletionDate = markedForDeletionDate
        self.starred = starred
        self.showInAutofill = showInAutofill
        self.id = id
    }
}
