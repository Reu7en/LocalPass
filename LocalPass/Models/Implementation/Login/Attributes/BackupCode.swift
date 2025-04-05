//
//  BackupCode.swift
//  LocalPass
//
//  Created by Reuben on 31/03/2025.
//

import Foundation

struct BackupCode: AttributeBase {
    static let minLength: Int = 1
    static let maxLength: Int = 1024
    
    let value: String
    
    init(_ value: String) throws {
        self.value = value
    }
    
    func validate() throws {
        var errors: [any Error] = []
        
        if self.value.count < BackupCode.minLength {
            errors.append(BackupCodeTooShort(value: self.value))
        }
        
        if self.value.count > BackupCode.maxLength {
            errors.append(BackupCodeTooLong(value: self.value))
        }
        
        try self.throwIfNeeded(errors)
    }
}
