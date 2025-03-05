//
//  OTPOutputLengthTooShort.swift
//  LocalPass
//
//  Created by Reuben on 04/03/2025.
//

import Foundation

struct OTPOutputLengthTooShort: OTPOutputLengthValidationErrorBase {
    let value: OTPOutputLength.Value
    let message: String?
    let inner: (any Error)?
    
    init(value: OTPOutputLength.Value, message: String? = nil, inner: (any Error)? = nil) {
        self.value = value
        self.message = message
        self.inner = inner
    }
}
