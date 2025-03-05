//
//  StringExtensions.swift
//  LocalPass
//
//  Created by Reuben on 27/02/2025.
//

import Foundation

extension String {
    var isBase32: Bool {
        guard !self.isEmpty else { return false }
        guard self.count % 8 == 0 else { return false }
        guard self.allSatisfy({ $0.isBase32 }) else { return false }
        
        if let paddingIndex = self.firstIndex(of: Character.base32PaddingCharacter) {
            guard self[paddingIndex...].allSatisfy({ $0 == Character.base32PaddingCharacter }) else { return false }
            
            let paddingCount = self[paddingIndex...].count
            let lengthBeforePadding = self.count - paddingCount
            
            switch lengthBeforePadding % 8 {
                case 0:
                    guard paddingCount == 0 else { return false }
                case 2:
                    guard paddingCount == 2 else { return false }
                case 4:
                    guard paddingCount == 4 else { return false }
                case 5:
                    guard paddingCount == 3 else { return false }
                case 6:
                    guard paddingCount == 2 else { return false }
                default:
                    return false
            }
        }
        
        return true
    }
}
