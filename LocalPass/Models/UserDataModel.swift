//
//  UserDataModel.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct UserData<T: FolderContent>: Identifiable, Codable {
    var logins: [Login]?
    var notes: [Note]?
    var cards: [Card]?
    var identities: [Identity]?
    var documents: [Document]?
    var addresses: [Address]?
    var folders: [Folder<T>]?
    var userSettings: UserSettingsModel
    let id: UUID
    
    init(
        logins: [Login]? = nil,
        notes: [Note]? = nil,
        cards: [Card]? = nil,
        identities: [Identity]? = nil, 
        documents: [Document]? = nil, 
        addresses: [Address]? = nil,
        folders: [Folder<T>]? = nil,
        userSettings: UserSettingsModel = UserSettingsModel(),
        id: UUID = UUID()
    ) {
        self.logins = logins
        self.notes = notes
        self.cards = cards
        self.identities = identities
        self.documents = documents
        self.addresses = addresses
        self.folders = folders
        self.userSettings = userSettings
        self.id = id
    }
}
