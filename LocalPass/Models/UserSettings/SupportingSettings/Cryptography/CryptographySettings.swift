//
//  CryptographySettings.swift
//  LocalPass
//
//  Created by Reuben on 30/07/2024.
//

import Foundation

struct CryptographySettings: Codable {
    var encryptionSettings: EncryptionSettings
    var keyDerivationSettings: KeyDerivationSettings
    var encryptedFileSettings: EncryptedFileSettings
    
    init() {
        self.encryptionSettings = EncryptionSettings()
        self.keyDerivationSettings = KeyDerivationSettings()
        self.encryptedFileSettings = EncryptedFileSettings()
    }
}
