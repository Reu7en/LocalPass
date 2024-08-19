//
//  Setting.swift
//  LocalPass
//
//  Created by Reuben on 13/07/2024.
//

import Foundation

struct Setting<T: Equatable & Codable>: Equatable, Codable {
    var value: T
    var authenticationRequired: AuthenticationRequired
    var updatedDate: Date?
    
    let minimumAuthenticationRequired: AuthenticationRequired
    
    init(
        value: T,
        minimumAuthenticationRequired: AuthenticationRequired
    ) {
        self.value = value
        self.authenticationRequired = minimumAuthenticationRequired
        self.updatedDate = nil
        
        self.minimumAuthenticationRequired = minimumAuthenticationRequired
    }
    
    static func == (lhs: Setting, rhs: Setting) -> Bool {
        lhs.value == rhs.value
    }
}
