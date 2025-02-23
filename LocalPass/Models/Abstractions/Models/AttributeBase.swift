//
//  AttributeBase.swift
//  LocalPass
//
//  Created by Reuben on 23/02/2025.
//

import Foundation

protocol AttributeBase: Base {
    associatedtype Value: Equatable
    
    var value: Value { get }
}

extension AttributeBase {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.value == rhs.value
    }
}
