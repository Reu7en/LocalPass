//
//  OTPTimeIntervalTooLong.swift
//  LocalPass
//
//  Created by Reuben on 04/03/2025.
//

import Foundation

struct OTPTimeIntervalTooLong: OTPTimeIntervalValidationErrorBase {
    let value: OTPTimeInterval.Value
    let message: String?
    let inner: (any Error)?
    
    init(value: OTPTimeInterval.Value, message: String? = nil, inner: (any Error)? = nil) {
        self.value = value
        self.message = message
        self.inner = inner
    }
}
