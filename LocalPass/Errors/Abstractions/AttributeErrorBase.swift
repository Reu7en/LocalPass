//
//  AttributeErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 26/02/2025.
//

import Foundation

protocol AttributeErrorBase: ErrorBase {
    associatedtype Attribute: AttributeBase
    
    var type: any AttributeBase.Type { get }
    var value: Attribute.Value { get }
}
