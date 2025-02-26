//
//  EntityNameErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 26/02/2025.
//

import Foundation

protocol EntityNameErrorBase: AttributeErrorBase {
    associatedtype Attribute = EntityName
    
    var value: EntityName.Value { get }
}

extension EntityNameErrorBase {
    var type: any AttributeBase.Type {
        return EntityName.self
    }
}
