//
//  LinkErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 05/04/2025.
//

import Foundation

protocol LinkErrorBase: AttributeErrorBase {
    associatedtype Attribute = Link
    
    var value: Link.Value { get }
}

extension LinkErrorBase {
    var type: any AttributeBase.Type {
        return Link.self
    }
}
