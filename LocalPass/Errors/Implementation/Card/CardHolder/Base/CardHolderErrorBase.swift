//
//  CardHolderErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 06/04/2025.
//

import Foundation

protocol CardHolderErrorBase: AttributeErrorBase {
    associatedtype Attribute = CardHolder
    
    var value: CardHolder.Value { get }
}

extension CardHolderErrorBase {
    var type: any AttributeBase.Type {
        return CardHolder.self
    }
}
