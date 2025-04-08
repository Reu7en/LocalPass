//
//  SecurityCodeTooShort.swift
//  LocalPass
//
//  Created by Reuben on 06/04/2025.
//

import Foundation

struct SecurityCodeTooShort: SecurityCodeValidationErrorBase {
    let value: SecurityCode.Value
    let message: String?
    let inner: (any Error)?
    
    init(value: SecurityCode.Value, message: String? = nil, inner: (any Error)? = nil) {
        self.value = value
        self.message = message
        self.inner = inner
    }
}
