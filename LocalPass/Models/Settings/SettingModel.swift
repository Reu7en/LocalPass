//
//  SettingModel.swift
//  LocalPass
//
//  Created by Reuben on 13/07/2024.
//

import Foundation

struct Setting<T: Equatable & Codable>: Equatable, Codable {
    var value: T
    var authenticationRequired: SettingAuthenticationRequired
    
    let minimumAuthenticationRequired: SettingAuthenticationRequired
    
    init(
        value: T,
        minimumAuthenticationRequired: SettingAuthenticationRequired
    ) {
        self.value = value
        self.authenticationRequired = minimumAuthenticationRequired
        
        self.minimumAuthenticationRequired = minimumAuthenticationRequired
    }
}

enum SettingAuthenticationRequired: Codable {
    case None
    case Minimum
    case Password
    case Maximum
}
