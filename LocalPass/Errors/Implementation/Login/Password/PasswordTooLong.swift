//
//  PasswordTooLong.swift
//  LocalPass
//
//  Created by Reuben on 04/04/2025.
//

import Foundation

struct PasswordTooLong: PasswordValidationErrorBase {
    let value: Password.Value
    let message: String?
    let inner: (any Error)?
    
    init(value: Password.Value, message: String? = nil, inner: (any Error)? = nil) {
        self.value = value
        self.message = message
        self.inner = inner
    }
}
