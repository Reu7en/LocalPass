//
//  ExpirationMonthOutOfRange.swift
//  LocalPass
//
//  Created by Reuben on 06/04/2025.
//

import Foundation

struct ExpirationMonthOutOfRange: ExpirationMonthValidationErrorBase {
    let value: ExpirationMonth.Value
    let message: String?
    let inner: (any Error)?
    
    init(value: ExpirationMonth.Value, message: String? = nil, inner: (any Error)? = nil) {
        self.value = value
        self.message = message
        self.inner = inner
    }
}
