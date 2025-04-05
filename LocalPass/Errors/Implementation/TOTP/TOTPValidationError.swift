//
//  TOTPValidationError.swift
//  LocalPass
//
//  Created by Reuben on 09/03/2025.
//

import Foundation

struct TOTPValidationError: TOTPValidationErrorBase {
    let id: UUID
    let message: String?
    let inner: (any Error)?
    
    init(id: UUID, message: String? = nil, inner: (any Error)? = nil) {
        self.id = id
        self.message = message
        self.inner = inner
    }
}
