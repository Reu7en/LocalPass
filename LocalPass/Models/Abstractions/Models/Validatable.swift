//
//  Validatable.swift
//  LocalPass
//
//  Created by Reuben on 23/02/2025.
//

import Foundation

protocol Validatable {
    var isValid: Bool { get }
    
    func validate() throws
}

extension Validatable {
    var isValid: Bool {
        return (try? validate()) != nil
    }
}
