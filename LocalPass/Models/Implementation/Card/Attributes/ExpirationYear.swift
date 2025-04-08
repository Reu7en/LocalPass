//
//  ExpirationYear.swift
//  LocalPass
//
//  Created by Reuben on 06/04/2025.
//

import Foundation

struct ExpirationYear: AttributeBase {
    static let minValue: Int = 2000
    static let maxValue: Int = 3000
    
    let value: Int
    
    init(_ value: Int) throws {
        self.value = value
    }
    
    func validate() throws {
        var errors: [any Error] = []
        
        if self.value < ExpirationYear.minValue || self.value > ExpirationYear.maxValue {
            errors.append(ExpirationYearOutOfRange(value: self.value))
        }
        
        try self.throwIfNeeded(errors)
    }
}
