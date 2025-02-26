//
//  EntityName.swift
//  LocalPass
//
//  Created by Reuben on 26/02/2025.
//

import Foundation

struct EntityName: AttributeBase {
    static let maxLength: Int = 128
    
    let value: String
    
    init(value: String) throws {
        self.value = value
        
        try self.validate()
    }
    
    func validate() throws {
        var errors: [any Error] = []
        
        if self.value.isEmpty {
            errors.append(EntityNameEmpty(value: self.value))
        }
        
        if self.value.count > EntityName.maxLength {
            errors.append(EntityNameTooLong(value: self.value))
        }
        
        try self.throwIfNeeded(errors)
    }
}
