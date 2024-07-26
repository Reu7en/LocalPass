//
//  UserSettingsModel.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

/*
 - Biometric preference to be stored in UserDefaults or similar, can be replicated in model for sync
 */
struct UserSettings: Identifiable, Codable {
    var suggestionSettings: SuggestionSettings
    var recycleBinSettings: RecycleBinSettings
    var cryptographySettings: KeyDerivationSettings
    var homeViewSettings: HomeViewSettings
    var biometricSettings: BiometricSettings
    var permissionSettings: PermissionSettings
    var updatedDate: Date?
    
    let creationDate: Date
    let id: UUID
    
    init() {
        self.suggestionSettings = SuggestionSettings()
        self.recycleBinSettings = RecycleBinSettings()
        self.cryptographySettings = KeyDerivationSettings()
        self.homeViewSettings = HomeViewSettings()
        self.biometricSettings = BiometricSettings()
        self.permissionSettings = PermissionSettings()
        self.updatedDate = nil
        
        self.creationDate = Date()
        self.id = UUID()
    }
}
