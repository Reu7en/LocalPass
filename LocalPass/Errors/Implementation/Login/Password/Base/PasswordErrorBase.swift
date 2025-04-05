//
//  PasswordErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 04/04/2025.
//

import Foundation

protocol PasswordErrorBase: AttributeErrorBase {
    associatedtype Attribute = Password
    
    var value: Password.Value { get }
}

extension PasswordErrorBase {
    var type: any AttributeBase.Type {
        return Password.self
    }
}
