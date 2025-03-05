//
//  OTPSecret.swift
//  LocalPass
//
//  Created by Reuben on 05/03/2025.
//

import Foundation

struct OTPSecret: AttributeBase {
    static let minLength: Int = 16
    static let recommendedMinLength: Int = 20
    
    let value: String
    
    init(_ value: String) {
        self.value = value
    }
    
    func validate() throws {
        var errors: [any Error] = []
        
        if !self.value.isBase32 {
            errors.append(OTPSecretInvalidBase32(value: self.value))
        }
        
        if self.value.count < OTPSecret.minLength {
            errors.append(OTPSecretTooShort(value: self.value))
        }
        
        if self.value.count < OTPSecret.recommendedMinLength {
            errors.append(OTPSecretShorterThanRecommended(value: self.value))
        }
        
        try self.throwIfNeeded(errors)
    }
}
