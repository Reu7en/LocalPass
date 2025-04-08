//
//  CardNumber.swift
//  LocalPass
//
//  Created by Reuben on 06/04/2025.
//

import Foundation

struct CardNumber: AttributeBase {
    static let minLength: Int = 12
    static let maxLength: Int = 19
    
    let value: String
    
    init(_ value: String) throws {
        self.value = value
    }
    
    func validate() throws {
        var errors: [any Error] = []
        
        if self.value.count < CardNumber.minLength {
            errors.append(CardNumberTooShort(value: self.value))
        }
        
        if self.value.count > CardNumber.maxLength {
            errors.append(CardNumberTooLong(value: self.value))
        }
        
        if !self.value.allSatisfy( { $0.isWholeNumber } ) {
            errors.append(CardNumberContainsNonDigits(value: self.value))
        }
        
        do {
            try self.validateLuhnsAlgorithm()
        } catch {
            errors.append(error)
        }
        
        try self.throwIfNeeded(errors)
    }
    
    func validate(for cardType: CardType) throws {
        var errors: [any Error] = []
        
        do {
            try self.validatePrefix(for: cardType)
        } catch {
            errors.append(error)
        }
        
        do {
            try self.validateLength(for: cardType)
        } catch {
            errors.append(error)
        }
        
        try self.throwIfNeeded(errors)
    }
    
    private func validateLuhnsAlgorithm() throws {
        let digits: [Int] = self.value.compactMap( { $0.wholeNumberValue } )
        
        let checksum: Int = digits.reversed().enumerated().reduce(0) { sum, pair in
            let (index, digit): (Int, Int) = pair
            
            if index % 2 == 1 {
                let doubled: Int = digit * 2
                
                return sum + (doubled > 9 ? doubled - 9 : doubled)
            } else {
                return sum + digit
            }
        }
        
        guard checksum % 10 == 0 else {
            throw CardNumberLuhnCheckFailed(value: self.value)
        }
    }
    
    private func validatePrefix(for cardType: CardType) throws {
        if !cardType.validCardNumberPrefixes.contains(where: { self.value.hasPrefix($0) } ) {
            throw CardNumberTooShortForCardType(value: self.value)
        }
    }
    
    private func validateLength(for cardType: CardType) throws {
        var errors: [any Error] = []
        
        if self.value.count < cardType.minCardNumberLength {
            errors.append(CardNumberTooShortForCardType(value: self.value))
        }
        
        if self.value.count > cardType.maxCardNumberLength {
            errors.append(CardNumberTooLongForCardType(value: self.value))
        }
        
        try self.throwIfNeeded(errors)
    }
}
