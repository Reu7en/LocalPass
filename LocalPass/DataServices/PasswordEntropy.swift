//
//  PasswordEntropy.swift
//  LocalPass
//
//  Created by Reuben on 22/07/2024.
//

import Foundation

struct PasswordEntropy {
    static func calculateEntropy(of password: String) -> Double {
        guard !password.isEmpty else {
            return 0.0
        }
        
        let uniqueCharacterCount = countUniqueCharacters(in: password)
        let length = Double(password.count)
        
        return length * log2(Double(uniqueCharacterCount))
    }
    
    private static func countUniqueCharacters(in password: String) -> Int {
        let uniqueCharacters = Set(password)
        
        return uniqueCharacters.count
    }
}
