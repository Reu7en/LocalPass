//
//  UserDataModel.swift
//  LocalPass
//
//  Created by Reuben on 13/07/2024.
//

import Foundation

struct UserData: Identifiable, Codable {
    var accounts: Folder<Account>?
    var notes: Folder<Note>?
    var cards: Folder<Card>?
    var identities: Folder<Identity>?
    var documents: Folder<Document>?
    var userSettings: UserSettings
    
    let id: UUID
    
    init() {
        self.accounts = nil
        self.notes = nil
        self.cards = nil
        self.identities = nil
        self.documents = nil
        
        self.userSettings = UserSettings()
        self.id = UUID()
    }
}
