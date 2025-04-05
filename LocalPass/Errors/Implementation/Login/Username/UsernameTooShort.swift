//
//  UsernameTooShort.swift
//  LocalPass
//
//  Created by Reuben on 05/04/2025.
//

import Foundation

struct UsernameTooShort: UsernameValidationErrorBase {
    let value: Username.Value
    let message: String?
    let inner: (any Error)?
    
    init(value: Username.Value, message: String? = nil, inner: (any Error)? = nil) {
        self.value = value
        self.message = message
        self.inner = inner
    }
}
