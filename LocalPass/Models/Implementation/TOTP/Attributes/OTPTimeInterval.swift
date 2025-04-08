//
//  OTPTimeInterval.swift
//  LocalPass
//
//  Created by Reuben on 05/03/2025.
//

import Foundation

struct OTPTimeInterval: AttributeBase {
    static let defaultValue: Int = 30
    static let minValue: Int = 1
    static let maxValue: Int = 60 * 60
    
    let value: Int
    
    init(_ value: Int = OTPTimeInterval.defaultValue) {
        self.value = value
    }
    
    func validate() throws {
        var errors: [any Error] = []
        
        if self.value < OTPTimeInterval.minValue {
            errors.append(OTPTimeIntervalTooShort(value: self.value))
        }
        
        if self.value > OTPTimeInterval.maxValue {
            errors.append(OTPTimeIntervalTooLong(value: self.value))
        }
        
        try self.throwIfNeeded(errors)
    }
}
