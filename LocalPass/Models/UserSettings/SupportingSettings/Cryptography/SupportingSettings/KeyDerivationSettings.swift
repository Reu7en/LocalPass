//
//  KeyDerivationSettings.swift
//  LocalPass
//
//  Created by Reuben on 13/07/2024.
//

import Foundation

struct KeyDerivationSettings: Codable {
    var keyDerivationAlgorithm: Setting<KeyDerivationAlgorithm>
    var saltLength: Setting<Int>
    var PBKDF2sha256Iterations: Setting<ClosedRange<UInt32>>
    var PBKDF2sha512Iterations: Setting<ClosedRange<UInt32>>
    var useTimeBasedIterations: Setting<Bool>
    var iterationMilliseconds: Setting<ClosedRange<UInt32>>
    var rotateKeyPerSession: Setting<Bool>
    
    init() {
        self.keyDerivationAlgorithm = Setting(value: .PBKDF2sha512, minimumAuthenticationRequired: .Password)
        self.saltLength = Setting(value: 32, minimumAuthenticationRequired: .Password)
        self.PBKDF2sha256Iterations = Setting(value: 600_000...1_200_000, minimumAuthenticationRequired: .Password)
        self.PBKDF2sha512Iterations = Setting(value: 210_000...420_000, minimumAuthenticationRequired: .Password)
        self.useTimeBasedIterations = Setting(value: false, minimumAuthenticationRequired: .Password)
        self.iterationMilliseconds = Setting(value: 100...200, minimumAuthenticationRequired: .Password)
        self.rotateKeyPerSession = Setting(value: true, minimumAuthenticationRequired: .Password)
    }
    
    static let minimumIterations: UInt32 = 10_000
}
