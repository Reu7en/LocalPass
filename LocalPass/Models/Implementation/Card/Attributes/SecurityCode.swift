//
//  SecurityCode.swift
//  LocalPass
//
//  Created by Reuben on 06/04/2025.
//

import Foundation

struct SecurityCode: AttributeBase {
    static let minLength: Int = 3
    static let maxLength: Int = 4
    
    let value: String
    
    init(_ value: String) throws {
        self.value = value
    }
    
    func validate() throws {
        var errors: [any Error] = []
        
        if self.value.count < SecurityCode.minLength {
            errors.append(SecurityCodeTooShort(value: self.value))
        }
        
        if self.value.count > SecurityCode.maxLength {
            errors.append(SecurityCodeTooLong(value: self.value))
        }
        
        if !self.value.allSatisfy( { $0.isWholeNumber } ) {
            errors.append(SecurityCodeContainsNonDigits(value: self.value))
        }
        
        try self.throwIfNeeded(errors)
    }
    
    func validate(for cardType: CardType) throws {
        var errors: [any Error] = []
        
        if self.value.count < cardType.minSecurityCodeLength {
            errors.append(SecurityCodeTooShortForCardType(value: self.value))
        }
        
        if self.value.count > cardType.maxSecurityCodeLength {
            errors.append(SecurityCodeTooLongForCardType(value: self.value))
        }
        
        try self.throwIfNeeded(errors)
    }
}
