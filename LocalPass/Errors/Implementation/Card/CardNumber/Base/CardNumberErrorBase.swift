//
//  CardNumberErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 06/04/2025.
//

import Foundation

protocol CardNumberErrorBase: AttributeErrorBase {
    associatedtype Attribute = CardNumber
    
    var value: CardNumber.Value { get }
}

extension CardNumberErrorBase {
    var type: any AttributeBase.Type {
        return CardNumber.self
    }
}
