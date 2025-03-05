//
//  EntityName.swift
//  LocalPass
//
//  Created by Reuben on 26/02/2025.
//

import Foundation

struct EntityName: AttributeBase {
    static let maxLength: Int = 256
    
    let value: String
    
    init(_ value: String) {
        self.value = value
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
