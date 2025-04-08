//
//  CardHolder.swift
//  LocalPass
//
//  Created by Reuben on 06/04/2025.
//

import Foundation

struct CardHolder: AttributeBase {
    static let minLength: Int = 1
    static let maxLength: Int = 1024
    
    let value: String
    
    init(_ value: String) throws {
        self.value = value
    }
    
    func validate() throws {
        var errors: [any Error] = []
        
        if self.value.count < CardHolder.minLength {
            errors.append(CardHolderTooShort(value: self.value))
        }
        
        if self.value.count > CardHolder.maxLength {
            errors.append(CardHolderTooLong(value: self.value))
        }
        
        try self.throwIfNeeded(errors)
    }
}
