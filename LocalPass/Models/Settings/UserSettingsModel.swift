//
//  UserSettingsModel.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

/*
 - Biometric preference to be stored in UserDefaults or similar, can be replicated in model for sync
 - Actual iterations used to be stored unencrypted with data blob or similar
 */
struct UserSettings: Identifiable, Codable {
    var suggestionData: SuggestionData
    var recycleBinSettings: RecycleBinSettings
    var iterations: Range<Int>?
    var updatedDate: Date?
    
    let creationDate: Date
    let id: UUID
    
    init() {
        self.suggestionData = SuggestionData()
        self.recycleBinSettings = RecycleBinSettings()
        self.iterations = nil
        self.updatedDate = nil
        
        self.creationDate = Date()
        self.id = UUID()
    }
}

struct SuggestionData: Codable {
    var usernames: [Username]?
    var emails: [Email]?
    
    init() {
        self.usernames = nil
        self.emails = nil
    }
}

struct RecycleBinSettings: Codable {
    var useRecycleBin: Bool
    var recycleTimeInterval: TimeInterval
    
    init() {
        self.useRecycleBin = false
        self.recycleTimeInterval = 28 * 24 * 60 * 60 // 28 Days
    }
}
