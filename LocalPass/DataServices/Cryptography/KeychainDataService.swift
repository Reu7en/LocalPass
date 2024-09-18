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
        let keyData = key.withUnsafeBytes { Data(Array($0)) }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassKey,
            kSecAttrApplicationTag as String: tag,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked,
            kSecAttrSynchronizable as String: synchronise ? kCFBooleanTrue! : kCFBooleanFalse!,
            kSecValueData as String: keyData
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        return status == errSecSuccess
    }
    
    static func read(with tag: String) -> SymmetricKey? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassKey,
            kSecAttrApplicationTag as String: tag,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard status == errSecSuccess, let keyData = item as? Data else { return nil }
        
        return SymmetricKey(data: keyData)
    }
    
    static func update(_ key: SymmetricKey, with tag: String, synchronise: Bool) -> Bool {
        let keyData = key.withUnsafeBytes { Data(Array($0)) }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassKey,
            kSecAttrApplicationTag as String: tag
        ]
        
        let attributesToUpdate: [String: Any] = [
            kSecValueData as String: keyData,
            kSecAttrSynchronizable as String: synchronise ? kCFBooleanTrue! : kCFBooleanFalse!
        ]
        
        let status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
        
        return status == errSecSuccess
    }
    
    static func delete(_ key: SymmetricKey, with tag: String) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassKey,
            kSecAttrApplicationTag as String: tag
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        return status == errSecSuccess
    }
    
    static func deleteAll() -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassKey
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        return status == errSecSuccess
    }
}
