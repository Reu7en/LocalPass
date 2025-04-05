//
//  EntityNameTooShort.swift
//  LocalPass
//
//  Created by Reuben on 09/03/2025.
//

import Foundation

struct EntityNameTooShort: EntityNameValidationErrorBase {
    let value: EntityName.Value
    let message: String?
    let inner: (any Error)?
    
    init(value: EntityName.Value, message: String? = nil, inner: (any Error)? = nil) {
        self.value = value
        self.message = message
        self.inner = inner
    }
}
