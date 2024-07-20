//
//  EncryptionSettingsModel.swift
//  LocalPass
//
//  Created by Reuben on 13/07/2024.
//

import Foundation

struct EncryptionSettings: Codable {
    var iterations: Setting<ClosedRange<Int>>
    
    init() {
        self.iterations = Setting(value: 600_000...1_000_000, minimumAuthenticationRequired: .Password)
    }
}
