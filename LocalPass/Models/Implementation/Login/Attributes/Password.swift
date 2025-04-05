//
//  Password.swift
//  LocalPass
//
//  Created by Reuben on 10/03/2025.
//

import Foundation

struct Password: AttributeBase {
    static let minLength: Int = 1
    static let maxLength: Int = 1024
    static let recommendedMinLength: Int = 12
    
    let value: String
    
    init(_ value: String) throws {
        self.value = value
    }
    
    func validate() throws {
        var errors: [any Error] = []
        
        if self.value.count < Password.minLength {
            errors.append(PasswordTooShort(value: self.value))
        }
        
        if self.value.count > Password.maxLength {
            errors.append(PasswordTooLong(value: self.value))
        }
        
        if self.value.count < Password.recommendedMinLength {
            errors.append(PasswordShorterThanRecommended(value: self.value))
        }
        
        try self.throwIfNeeded(errors)
    }
}
