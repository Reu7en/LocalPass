//
//  ExpirationMonthErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 06/04/2025.
//

import Foundation

protocol ExpirationMonthErrorBase: AttributeErrorBase {
    associatedtype Attribute = ExpirationMonth
    
    var value: ExpirationMonth.Value { get }
}

extension ExpirationMonthErrorBase {
    var type: any AttributeBase.Type {
        return ExpirationMonth.self
    }
}
