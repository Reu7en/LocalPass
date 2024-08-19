//
//  SuggestionSettings.swift
//  LocalPass
//
//  Created by Reuben on 13/07/2024.
//

import Foundation

struct SuggestionSettings: Codable {
    var usernames: Setting<[Username]?>
    var emails: Setting<[Email]?>
    var titles: Setting<[Title]?>
    
    init() {
        self.usernames = Setting(value: nil, minimumAuthenticationRequired: .None)
        self.emails = Setting(value: nil, minimumAuthenticationRequired: .None)
        self.titles = Setting(value: nil, minimumAuthenticationRequired: .None)
    }
}
