//
//  CardValidator.swift
//  LocalPass
//
//  Created by Reuben on 21/07/2024.
//

import Foundation

struct CardValidator {
    static func validate(cardNumber: Int64) -> CardType? {
        guard isValidLuhnNumber(cardNumber) else {
            return nil
        }
        
        return getCardType(for: cardNumber)
    }
    
    static func validate(cvv: Int, for cardType: CardType) -> Bool {
        return cvv.toDigitArray().count == cardType.cvvLength
    }
    
    private static func isValidLuhnNumber(_ cardNumber: Int64) -> Bool {
        let cardNumberDigits = cardNumber.toDigitArray()
        var sum = 0
        
        for (index, digit) in cardNumberDigits.reversed().enumerated() {
            if index % 2 == 1 {
                sum += (digit == 9 ? 9 : (digit * 2) % 9)
            } else {
                sum += digit
            }
        }
        
        return sum % 10 == 0
    }
    
    private static func getCardType(for cardNumber: Int64) -> CardType? {
        let cardNumberDigits = cardNumber.toDigitArray()
        
        switch cardNumberDigits.prefix(4) {
        case let prefix where prefix.starts(with: [4]):
            return .visa
        case let prefix where prefix.starts(with: [5]) && prefix.count > 1 && (1...5).contains(prefix[1]):
            return .mastercard
        case let prefix where prefix.starts(with: [3]) && prefix.count > 1 && (4...7).contains(prefix[1]):
            return .amex
        case let prefix where prefix.starts(with: [6, 0, 1, 1]) || prefix.starts(with: [6, 5]):
            return .discover
        default:
            return .unknown
        }
    }
}

enum CardType {
    case visa
    case mastercard
    case amex
    case discover
    case unknown
    
    var cvvLength: Int {
        switch self {
        case .amex:
            return 4
        case .visa, .mastercard, .discover:
            return 3
        case .unknown:
            return 3
        }
    }
}
