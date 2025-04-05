//
//  LinkTooShort.swift
//  LocalPass
//
//  Created by Reuben on 05/04/2025.
//

import Foundation

struct LinkTooShort: LinkValidationErrorBase {
    let value: Link.Value
    let message: String?
    let inner: (any Error)?
    
    init(value: Link.Value, message: String? = nil, inner: (any Error)? = nil) {
        self.value = value
        self.message = message
        self.inner = inner
    }
}
