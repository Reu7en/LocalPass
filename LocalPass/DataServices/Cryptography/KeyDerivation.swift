//
//  KeyDerivation.swift
//  LocalPass
//
//  Created by Reuben on 22/07/2024.
//

import Foundation
import CryptoKit
import CommonCrypto

struct KeyDerivation {
    static func deriveKey(from password: String, with settings: KeyDerivationSettings) -> SymmetricKey? {
        guard let salt = generateSalt(length: settings.saltLength.value) else {
            return nil
        }
        
        switch settings.keyDerivationAlgorithm.value {
        case .PBKDF2sha256:
            return PBKDF2sha256(password, salt, Int.random(in: settings.PBKDF2sha256Iterations.value))
        case .PBKDF2sha512:
            return PBKDF2sha512(password, salt, Int.random(in: settings.PBKDF2sha512Iterations.value))
        }
    }
    
    static func deriveKey(from password: String, with settings: KeyDerivationSettings, salt: Data) -> SymmetricKey? {
        switch settings.keyDerivationAlgorithm.value {
        case .PBKDF2sha256:
            return PBKDF2sha256(password, salt, Int.random(in: settings.PBKDF2sha256Iterations.value))
        case .PBKDF2sha512:
            return PBKDF2sha512(password, salt, Int.random(in: settings.PBKDF2sha512Iterations.value))
        }
    }
    
    private static func generateSalt(length: Int) -> Data? {
        var salt = [UInt8](repeating: 0, count: length)
        let status = SecRandomCopyBytes(kSecRandomDefault, salt.count, &salt)
        
        return status == errSecSuccess ? Data(salt) : nil
    }
    
    private static func PBKDF2sha256(_ password: String, _ salt: Data, _ iterations: Int) -> SymmetricKey? {
        var key = Data(repeating: 0, count: SHA256Digest.byteCount)
        
        let result = key.withUnsafeMutableBytes { keyBytes in
            salt.withUnsafeBytes { saltBytes in
                CCKeyDerivationPBKDF(
                    CCPBKDFAlgorithm(kCCPBKDF2),
                    password,
                    password.utf8.count,
                    saltBytes.baseAddress?.assumingMemoryBound(to: UInt8.self),
                    salt.count,
                    CCPseudoRandomAlgorithm(kCCPRFHmacAlgSHA256),
                    UInt32(iterations),
                    keyBytes.baseAddress?.assumingMemoryBound(to: UInt8.self),
                    SHA256Digest.byteCount
                )
            }
        }
        
        guard result == kCCSuccess else {
            return nil
        }
        
        return SymmetricKey(data: key)
    }
    
    private static func PBKDF2sha512(_ password: String, _ salt: Data, _ iterations: Int) -> SymmetricKey? {
        var key = [UInt8](repeating: 0, count: SHA512Digest.byteCount)
        
        let result = key.withUnsafeMutableBytes { keyBytes in
            salt.withUnsafeBytes { saltBytes in
                CCKeyDerivationPBKDF(
                    CCPBKDFAlgorithm(kCCPBKDF2),
                    password,
                    password.utf8.count,
                    saltBytes.baseAddress?.assumingMemoryBound(to: UInt8.self),
                    salt.count,
                    CCPseudoRandomAlgorithm(kCCPRFHmacAlgSHA512),
                    UInt32(iterations),
                    keyBytes.baseAddress?.assumingMemoryBound(to: UInt8.self),
                    SHA512Digest.byteCount
                )
            }
        }
        
        guard result == kCCSuccess else {
            return nil
        }
        
        return SymmetricKey(data: key)
    }
}

enum KeyDerivationAlgorithm: CaseIterable, Codable {
    case PBKDF2sha256
    case PBKDF2sha512
}
