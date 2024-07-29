//
//  HomeViewSettingsModel.swift
//  LocalPass
//
//  Created by Reuben on 13/07/2024.
//

import Foundation

struct HomeViewSettings: Codable {
    var showLogins: Setting<Bool>
    var showNotes: Setting<Bool>
    var showCards: Setting<Bool>
    var showIdentities: Setting<Bool>
    
    init() {
        self.showLogins = Setting(value: true, minimumAuthenticationRequired: .None)
        self.showNotes = Setting(value: true, minimumAuthenticationRequired: .None)
        self.showCards = Setting(value: true, minimumAuthenticationRequired: .None)
        self.showIdentities = Setting(value: true, minimumAuthenticationRequired: .None)
    }
}
