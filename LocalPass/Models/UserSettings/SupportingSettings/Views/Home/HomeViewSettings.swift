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
