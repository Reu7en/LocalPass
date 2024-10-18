//
//  HomeTabViewSettings.swift
//  LocalPass
//
//  Created by Reuben on 25/09/2024.
//

import Foundation

struct HomeTabViewSettings: Codable {
    var showAccounts: Setting<Bool>
    var showNotes: Setting<Bool>
    var showCards: Setting<Bool>
    var showIdentities: Setting<Bool>
    var showLabels: Setting<Bool>
    
    init() {
        self.showAccounts = Setting(value: true, minimumAuthenticationRequired: .None)
        self.showNotes = Setting(value: true, minimumAuthenticationRequired: .None)
        self.showCards = Setting(value: true, minimumAuthenticationRequired: .None)
        self.showIdentities = Setting(value: true, minimumAuthenticationRequired: .None)
        self.showLabels = Setting(value: true, minimumAuthenticationRequired: .None)
    }
}
