//
//  ExpirationYearErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 06/04/2025.
//

import Foundation

protocol ExpirationYearErrorBase: AttributeErrorBase {
    associatedtype Attribute = ExpirationYear
    
    var value: ExpirationYear.Value { get }
}

extension ExpirationYearErrorBase {
    var type: any AttributeBase.Type {
        return ExpirationYear.self
    }
}
