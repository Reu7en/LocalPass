//
//  AESGCMDataService.swift
//  LocalPass
//
//  Created by Reuben on 30/07/2024.
//

import Foundation
import CryptoKit

struct AESGCMDataService {
    static func encrypt(_ data: Data, using key: SymmetricKey) -> Data? {
        return try? AES.GCM.seal(data, using: key).combined
    }
    
    static func decrypt(_ data: Data, using key: SymmetricKey) -> Data? {
        return try? AES.GCM.open(AES.GCM.SealedBox(combined: data), using: key)
    }
    
    static func encrypt(_ data: Data, using key: SymmetricKey, authenticating authenticatedData: Data) -> Data? {
        return try? AES.GCM.seal(data, using: key, authenticating: authenticatedData).combined
    }
    
    static func decrypt(_ data: Data, using key: SymmetricKey, authenticating authenticatedData: Data) -> Data? {
        return try? AES.GCM.open(AES.GCM.SealedBox(combined: data), using: key, authenticating: authenticatedData)
    }
}
