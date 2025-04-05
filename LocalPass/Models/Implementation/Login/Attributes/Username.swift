//
//  Username.swift
//  LocalPass
//
//  Created by Reuben on 10/03/2025.
//

import Foundation

struct Username: AttributeBase {
    static let minLength: Int = 1
    static let maxLength: Int = 1024
    
    let value: String
    
    init(_ value: String) throws {
        self.value = value
        
        try self.validate()
    }
    
    func validate() throws {
        var errors: [any Error] = []
        
        if self.value.count < Username.minLength {
            errors.append(UsernameTooShort(value: self.value))
        }
        
        if self.value.count > Username.maxLength {
            errors.append(UsernameTooLong(value: self.value))
        }
        
        try self.throwIfNeeded(errors)
    }
}
