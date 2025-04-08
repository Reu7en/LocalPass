//
//  ExpirationMonth.swift
//  LocalPass
//
//  Created by Reuben on 06/04/2025.
//

import Foundation

struct ExpirationMonth: AttributeBase {
    static let minValue: Int = 1
    static let maxValue: Int = 12
    
    let value: Int
    
    init(_ value: Int) throws {
        self.value = value
    }
    
    func validate() throws {
        var errors: [any Error] = []
        
        if self.value < ExpirationMonth.minValue || self.value > ExpirationMonth.maxValue {
            errors.append(ExpirationMonthOutOfRange(value: self.value))
        }
        
        try self.throwIfNeeded(errors)
    }
}
