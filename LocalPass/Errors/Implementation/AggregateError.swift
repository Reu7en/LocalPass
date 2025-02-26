//
//  AggregateError.swift
//  LocalPass
//
//  Created by Reuben on 26/02/2025.
//

import Foundation

struct AggregateError: Error {
    let values: [any Error]
    let message: String?
    
    init(values: [any Error], message: String? = nil) {
        self.values = values
        self.message = message
    }
}
