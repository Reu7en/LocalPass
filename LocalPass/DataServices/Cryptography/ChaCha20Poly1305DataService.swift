//
//  ChaCha20Poly1305DataService.swift
//  LocalPass
//
//  Created by Reuben on 30/07/2024.
//

import Foundation
import CryptoKit

struct ChaCha20Poly1305DataService {
    static func encrypt(_ data: Data, using key: SymmetricKey) -> Data? {
        return try? ChaChaPoly.seal(data, using: key).combined
    }
    
    static func decrypt(_ data: Data, using key: SymmetricKey) -> Data? {
        return try? ChaChaPoly.open(ChaChaPoly.SealedBox(combined: data), using: key)
    }
    
    static func encrypt(_ data: Data, using key: SymmetricKey, authenticating authenticatedData: Data) -> Data? {
        return try? ChaChaPoly.seal(data, using: key, authenticating: authenticatedData).combined
    }
    
    static func decrypt(_ data: Data, using key: SymmetricKey, authenticating authenticatedData: Data) -> Data? {
        return try? ChaChaPoly.open(ChaChaPoly.SealedBox(combined: data), using: key, authenticating: authenticatedData)
    }
}
