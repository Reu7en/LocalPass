//
//  EncryptedFileSettingsModel.swift
//  LocalPass
//
//  Created by Reuben on 23/07/2024.
//

import Foundation

struct EncryptedFileSettings: Codable {
    var encryptedFileExtension: Setting<EncryptedFileExtension>
    var encryptedFilename: Setting<String>
    var useUUIDAsEncryptedFilename: Setting<Bool>
    
    init() {
        self.encryptedFileExtension = Setting(value: .localPass, minimumAuthenticationRequired: .Minimum)
        self.encryptedFilename = Setting(value: "vault_\(UUID().uuidString)", minimumAuthenticationRequired: .Minimum)
        self.useUUIDAsEncryptedFilename = Setting(value: true, minimumAuthenticationRequired: .Minimum)
    }
}

enum EncryptedFileExtension: String, CaseIterable, Codable {
    case localPass
    case bin
    case txt
}
