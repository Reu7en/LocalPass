//
//  EntityValidationErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 26/02/2025.
//

import Foundation

protocol EntityValidationErrorBase: EntityErrorBase {
    init(id: UUID, message: String?, inner: (any Error)?)
}
