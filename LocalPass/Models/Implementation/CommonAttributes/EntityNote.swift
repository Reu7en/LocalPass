//
//  EntityNote.swift
//  LocalPass
//
//  Created by Reuben on 10/03/2025.
//

import Foundation

struct EntityNote: AttributeBase {
    static let minLength: Int = 1
    static let maxLength: Int = 1024
    
    let value: String
    
    init(_ value: String) throws {
        self.value = value
    }
    
    func validate() throws {
        var errors: [any Error] = []
        
        if self.value.count < EntityNote.minLength {
            errors.append(EntityNoteTooShort(value: self.value))
        }
        
        if self.value.count > EntityNote.maxLength {
            errors.append(EntityNoteTooLong(value: self.value))
        }
        
        try self.throwIfNeeded(errors)
    }
}
