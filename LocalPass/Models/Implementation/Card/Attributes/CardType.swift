//
//  CardType.swift
//  LocalPass
//
//  Created by Reuben on 06/04/2025.
//

import Foundation

enum CardType: EnumBase {
    case visa
    case mastercard
    case amex
    case discover
    case other
    
    var validCardNumberPrefixes: [String] {
        switch self {
            case .visa:
                return ["4"]
            case .mastercard:
                return ["51", "52", "53", "54", "55"] + (2221...2720).map( { $0.description } )
            case .amex:
                return ["34", "37"]
            case .discover:
                return ["6011", "64", "65"] + (622126...622925).map( { $0.description } )
            case .other:
                return (0...9).map( { $0.description } )
        }
    }
    
    var minCardNumberLength: Int {
        switch self {
            case .visa:
                return 13
            case .mastercard:
                return 16
            case .amex:
                return 15
            case .discover:
                return 16
            case .other:
                return 12
        }
    }
    
    var maxCardNumberLength: Int {
        switch self {
            case .visa:
                return 19
            case .mastercard:
                return 16
            case .amex:
                return 15
            case .discover:
                return 16
            case .other:
                return 24
        }
    }
    
    var minSecurityCodeLength: Int {
        switch self {
            case .visa, .mastercard, .discover:
                return 3
            case .amex:
                return 4
            case .other:
                return 1
        }
    }
    
    var maxSecurityCodeLength: Int {
        switch self {
            case .visa, .mastercard, .discover:
                return 3
            case .amex:
                return 4
            case .other:
                return 8
        }
    }
}
