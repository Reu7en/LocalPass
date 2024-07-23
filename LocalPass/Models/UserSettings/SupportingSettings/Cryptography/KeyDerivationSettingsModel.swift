//
//  KeyDerivationSettingsModel.swift
//  LocalPass
//
//  Created by Reuben on 13/07/2024.
//

import Foundation

struct KeyDerivationSettings: Codable {
    var keyDerivationAlgorithm: Setting<KeyDerivationAlgorithm>
    var PBKDF2sha256Iterations: Setting<ClosedRange<Int>>
    var PBKDF2sha512Iterations: Setting<ClosedRange<Int>>
    var saltLength: Setting<Int>
    
    init() {
        self.keyDerivationAlgorithm = Setting(value: .PBKDF2sha512, minimumAuthenticationRequired: .Password)
        self.PBKDF2sha256Iterations = Setting(value: 600_000...1_200_000, minimumAuthenticationRequired: .Password)
        self.PBKDF2sha512Iterations = Setting(value: 210_000...420_000, minimumAuthenticationRequired: .Password)
        self.saltLength = Setting(value: 32, minimumAuthenticationRequired: .Password)
    }
}
