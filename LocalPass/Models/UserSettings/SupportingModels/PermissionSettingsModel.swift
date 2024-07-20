//
//  PermissionSettings.swift
//  LocalPass
//
//  Created by Reuben on 20/07/2024.
//

import Foundation

struct PermissionSettings: Codable {
    var minimumAuthenticationRequired: Setting<AuthenticationRequired>
    
    init() {
        self.minimumAuthenticationRequired = Setting(value: .None, minimumAuthenticationRequired: .Maximum)
    }
}
