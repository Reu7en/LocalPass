//
//  BiometricSettingsModel.swift
//  LocalPass
//
//  Created by Reuben on 20/07/2024.
//

import Foundation

struct BiometricSettings: Codable {
    var useBiometrics: Setting<Bool>
    var useBiometricsForVault: Setting<Bool>
    var useBiometricsForAutofill: Setting<Bool>
    
    init() {
        self.useBiometrics = Setting(value: false, minimumAuthenticationRequired: .Password)
        self.useBiometricsForVault = Setting(value: false, minimumAuthenticationRequired: .Password)
        self.useBiometricsForAutofill = Setting(value: false, minimumAuthenticationRequired: .Password)
    }
}
