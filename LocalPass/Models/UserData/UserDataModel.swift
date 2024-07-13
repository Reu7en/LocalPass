//
//  UserDataModel.swift
//  LocalPass
//
//  Created by Reuben on 13/07/2024.
//

import Foundation

struct UserData: Identifiable, Codable {
    var logins: [FolderContentType<Login>]?
    var notes: [FolderContentType<Note>]?
    var cards: [FolderContentType<Card>]?
    var identities: [FolderContentType<Identity>]?
    var documents: [FolderContentType<Document>]?
    var addresses: [FolderContentType<Address>]?
    var userSettings: UserSettings
    
    let id: UUID
    
    init() {
        self.logins = nil
        self.notes = nil
        self.cards = nil
        self.identities = nil
        self.documents = nil
        self.addresses = nil
        
        self.userSettings = UserSettings()
        self.id = UUID()
    }
}
