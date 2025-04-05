//
//  UsernameErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 05/04/2025.
//

import Foundation

protocol UsernameErrorBase: AttributeErrorBase {
    associatedtype Attribute = Username
    
    var value: Username.Value { get }
}

extension UsernameErrorBase {
    var type: any AttributeBase.Type {
        return Username.self
    }
}
