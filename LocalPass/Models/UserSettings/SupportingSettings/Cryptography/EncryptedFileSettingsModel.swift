//
//  EncryptedFileSettingsModel.swift
//  LocalPass
//
//  Created by Reuben on 23/07/2024.
//

import Foundation

struct EncryptedFileSettings: Codable {
    var encryptedFileExtension: Setting<EncryptedFileExtension>
    var encryptedFilename: Setting<EncryptedFilename>
    var rotateFilenameId: Setting<Bool>
    
    init() {
        self.encryptedFileExtension = Setting(value: .localPass, minimumAuthenticationRequired: .Minimum)
        self.encryptedFilename = Setting(value: .id, minimumAuthenticationRequired: .Minimum)
        self.rotateFilenameId = Setting(value: true, minimumAuthenticationRequired: .Minimum)
    }
}

enum EncryptedFilename: CaseIterable, Codable {
    case id
    case name
}

enum EncryptedFileExtension: CaseIterable, Codable {
    case localPass
    case bin
    case txt
}
