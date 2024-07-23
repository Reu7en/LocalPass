//
//  EncryptedUserDataModel.swift
//  LocalPass
//
//  Created by Reuben on 23/07/2024.
//

import Foundation

struct EncryptedUserData: Identifiable, Codable {
    let blob: Data
    let salt: Data
    let keyDerivationSettings: KeyDerivationSettings
    let id: UUID
    
    init(
        blob: Data,
        salt: Data,
        keyDerivationSettings: KeyDerivationSettings,
        id: UUID
    ) {
        self.blob = blob
        self.salt = salt
        self.keyDerivationSettings = keyDerivationSettings
        self.id = id
    }
}
