//
//  Link.swift
//  LocalPass
//
//  Created by Reuben on 10/03/2025.
//

import Foundation

struct Link: AttributeBase {
    static let minLength: Int = 1
    static let maxLength: Int = 1024
    
    let value: URL
    
    init(_ value: URL) throws {
        self.value = value
    }
    
    func validate() throws {
        var errors: [any Error] = []
        
        if self.value.absoluteString.count < Link.minLength {
            errors.append(LinkTooShort(value: self.value))
        }
        
        if self.value.absoluteString.count > Link.maxLength {
            errors.append(LinkTooLong(value: self.value))
        }
        
        try self.throwIfNeeded(errors)
    }
}
