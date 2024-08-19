//
//  RecycleBinSettings.swift
//  LocalPass
//
//  Created by Reuben on 13/07/2024.
//

import Foundation

struct RecycleBinSettings: Codable {
    var useRecycleBin: Setting<Bool>
    var recycleTimeInterval: Setting<TimeInterval>
    
    init() {
        self.useRecycleBin = Setting(value: true, minimumAuthenticationRequired: .None)
        self.recycleTimeInterval = Setting(value: 28 * 24 * 60 * 60, minimumAuthenticationRequired: .None) // 28 Days
    }
}
