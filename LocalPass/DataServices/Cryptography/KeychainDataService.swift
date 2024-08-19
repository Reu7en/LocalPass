//
//  KeychainDataService.swift
//  LocalPass
//
//  Created by Reuben on 08/08/2024.
//

import Foundation
import CryptoKit

struct KeychainDataService {
    static func save(_ key: SymmetricKey, with tag: String, synchronise: Bool) -> Bool {
        return true
    }
    
    static func read(with tag: String) -> SymmetricKey? {
        return nil
    }
    
    static func update(_ key: SymmetricKey, with tag: String, synchronise: Bool) -> Bool {
        return true
    }
    
    static func delete(_ key: SymmetricKey, with tag: String) -> Bool {
        return true
    }
    
    static func deleteAll() -> Bool {
        return true
    }
}
