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
struct UserSettingsModel: Identifiable, Codable {
    var suggestionData: SuggestionData
    var recycleBinSettings: RecycleBinSettings
    var iterations: Range<Int>?
    let creationDate: Date
    var updatedDate: Date?
    let id: UUID
    
    init(
        suggestionData: SuggestionData = SuggestionData(),
        recycleBinSettings: RecycleBinSettings = RecycleBinSettings(),
        iterations: Range<Int>? = nil,
        creationDate: Date = Date(),
        updatedDate: Date? = nil,
        id: UUID = UUID()
    ) {
        self.suggestionData = suggestionData
        self.recycleBinSettings = recycleBinSettings
        self.iterations = iterations
        self.creationDate = creationDate
        self.updatedDate = updatedDate
        self.id = id
    }
}

struct SuggestionData: Codable {
    var usernames: [Username]?
    var emails: [Email]?
    
    init(
        usernames: [Username]? = nil,
        emails: [Email]? = nil
    ) {
        self.usernames = usernames
        self.emails = emails
    }
}

struct RecycleBinSettings: Codable {
    var useRecycleBin: Bool
    var recycleTimeInterval: TimeInterval
    
    init(
        useRecycleBin: Bool = false,
        recycleTimeInterval: TimeInterval = 28 * 24 * 60 * 60 // 28 Days
    ) {
        self.useRecycleBin = useRecycleBin
        self.recycleTimeInterval = recycleTimeInterval
    }
}
