//
//  BinaryIntegerToDigitArray.swift
//  LocalPass
//
//  Created by Reuben on 21/07/2024.
//

import Foundation

extension BinaryInteger {
    func toDigitArray() -> [Int] {
        var num = self
        var digits: [Int] = []
        
        if num == 0 {
            return [0]
        }
        
        while num > 0 {
            let digit = Int(num % 10)
            
            digits.insert(digit, at: 0)
            num /= 10
        }
        
        return digits
    }
}
