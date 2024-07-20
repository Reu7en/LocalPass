//
//  SuggestionSettingsModel.swift
//  LocalPass
//
//  Created by Reuben on 13/07/2024.
//

import Foundation

struct SuggestionSettings: Codable {
    var usernames: Setting<[Username]?>
    var emails: Setting<[Email]?>
    
    init() {
        self.usernames = Setting(value: nil, minimumAuthenticationRequired: .None)
        self.emails = Setting(value: nil, minimumAuthenticationRequired: .None)
    }
}
