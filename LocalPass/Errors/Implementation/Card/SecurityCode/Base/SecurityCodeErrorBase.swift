//
//  SecurityCodeErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 06/04/2025.
//

import Foundation

protocol SecurityCodeErrorBase: AttributeErrorBase {
    associatedtype Attribute = SecurityCode
    
    var value: SecurityCode.Value { get }
}

extension SecurityCodeErrorBase {
    var type: any AttributeBase.Type {
        return SecurityCode.self
    }
}
