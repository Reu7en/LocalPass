//
//  HomeViewSettings.swift
//  LocalPass
//
//  Created by Reuben on 13/07/2024.
//

import Foundation

struct HomeViewSettings: Codable {
    var homeTabViewSettings: HomeTabViewSettings
    
    init() {
        self.homeTabViewSettings = HomeTabViewSettings()
    }
}


struct HomeTabViewSettings: Codable {
    var showAccounts: Setting<Bool>
    var showNotes: Setting<Bool>
    var showCards: Setting<Bool>
    var showIdentities: Setting<Bool>
    
    init() {
        self.showAccounts = Setting(value: true, minimumAuthenticationRequired: .None)
        self.showNotes = Setting(value: true, minimumAuthenticationRequired: .None)
        self.showCards = Setting(value: true, minimumAuthenticationRequired: .None)
        self.showIdentities = Setting(value: true, minimumAuthenticationRequired: .None)
    }
}
