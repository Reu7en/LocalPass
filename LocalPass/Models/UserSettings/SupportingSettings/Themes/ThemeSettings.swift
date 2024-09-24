//
//  ThemeSettings.swift
//  LocalPass
//
//  Created by Reuben on 24/09/2024.
//

import Foundation

struct ThemeSettings: Codable {
    var currentTheme: Setting<Theme>
    
    init() {
        self.currentTheme = Setting(value: Theme.defaultTheme, minimumAuthenticationRequired: .None)
    }
}
