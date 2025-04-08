//
//  CardNumberContainsNonDigits.swift
//  LocalPass
//
//  Created by Reuben on 06/04/2025.
//

import Foundation

struct CardNumberContainsNonDigits: CardNumberValidationErrorBase {
    let value: CardNumber.Value
    let message: String?
    let inner: (any Error)?
    
    init(value: CardNumber.Value, message: String? = nil, inner: (any Error)? = nil) {
        self.value = value
        self.message = message
        self.inner = inner
    }
}
