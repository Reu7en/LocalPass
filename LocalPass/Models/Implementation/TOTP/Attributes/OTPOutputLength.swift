//
//  OTPOutputLength.swift
//  LocalPass
//
//  Created by Reuben on 05/03/2025.
//

import Foundation

struct OTPOutputLength: AttributeBase {
    static let defaultValue: Int = 6
    static let minValue: Int = 6
    static let maxValue: Int = 8
    
    let value: Int
    
    init(_ value: Int = OTPOutputLength.defaultValue) {
        self.value = value
    }
    
    func validate() throws {
        var errors: [any Error] = []
        
        if self.value < OTPOutputLength.minValue {
            errors.append(OTPOutputLengthTooShort(value: self.value))
        }
        
        if self.value > OTPOutputLength.maxValue {
            errors.append(OTPOutputLengthTooLong(value: self.value))
        }
        
        try self.throwIfNeeded(errors)
    }
}
