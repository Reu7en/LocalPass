//
//  EncryptionSettings.swift
//  LocalPass
//
//  Created by Reuben on 23/07/2024.
//

import Foundation

struct EncryptionSettings: Codable {
    var encryptionAlgorithms: Setting<[EncryptionAlgorithm]>
    var numberOfRounds: Setting<Int>
    
    init() {
        self.encryptionAlgorithms = Setting(value: [.AESGCM, .ChaCha20Poly1305], minimumAuthenticationRequired: .Maximum)
        self.numberOfRounds = Setting(value: 2, minimumAuthenticationRequired: .Maximum)
    }
    
    static let maxDepth: Int = 64
}
