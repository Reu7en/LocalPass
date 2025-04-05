//
//  EntityName.swift
//  LocalPass
//
//  Created by Reuben on 26/02/2025.
//

import Foundation

struct EntityName: AttributeBase {
    static let minLength: Int = 1
    static let maxLength: Int = 1024
    
    let value: String
    
    init(_ value: String) {
        self.value = value
    }
    
    func validate() throws {
        var errors: [any Error] = []
        
        if self.value.count < EntityName.minLength {
            errors.append(EntityNameTooShort(value: self.value))
        }
        
        if self.value.count > EntityName.maxLength {
            errors.append(EntityNameTooLong(value: self.value))
        }
        
        try self.throwIfNeeded(errors)
    }
}
