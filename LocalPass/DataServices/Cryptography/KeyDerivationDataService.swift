//
//  KeyDerivationDataService.swift
//  LocalPass
//
//  Created by Reuben on 22/07/2024.
//

import Foundation
import CryptoKit
import CommonCrypto

struct KeyDerivationDataService {
    static func deriveKey(from password: String, with settings: KeyDerivationSettings) -> SymmetricKey? {
        guard let salt = generateSalt(length: settings.saltLength.value) else {
            return nil
        }
        
        let iterations = calculateIterations(with: settings)
        
        switch settings.keyDerivationAlgorithm.value {
        case .PBKDF2sha256:
            return PBKDF2sha256(password, salt, iterations)
        case .PBKDF2sha512:
            return PBKDF2sha512(password, salt, iterations)
        }
    }
    
    static func deriveKey(from password: String, salt: Data, iterations: UInt32, with keyDerivationAlgorithm: KeyDerivationAlgorithm) -> SymmetricKey? {
        switch keyDerivationAlgorithm {
        case .PBKDF2sha256:
            return PBKDF2sha256(password, salt, iterations)
        case .PBKDF2sha512:
            return PBKDF2sha512(password, salt, iterations)
        }
    } 
    
    private static func generateSalt(length: Int) -> Data? {
        var salt = [UInt8](repeating: 0, count: length)
        let status = SecRandomCopyBytes(kSecRandomDefault, salt.count, &salt)
        
        return status == errSecSuccess ? Data(salt) : nil
    }
    
    private static func calculateIterations(with settings: KeyDerivationSettings) -> UInt32 {
        if settings.useTimeBasedIterations.value,
           let iterations = calculateTimeBasedIterations(with: settings) {
            return iterations
        } else {
            switch settings.keyDerivationAlgorithm.value {
            case .PBKDF2sha256:
                return UInt32.random(in: settings.PBKDF2sha256Iterations.value)
            case .PBKDF2sha512:
                return UInt32.random(in: settings.PBKDF2sha512Iterations.value)
            }
        }
    }
    
    private static func calculateTimeBasedIterations(with settings: KeyDerivationSettings) -> UInt32? {
        guard let testSalt = generateSalt(length: settings.saltLength.value) else {
            return nil
        }
        
        let testIterations: UInt32 = 10_000
        let testPassword = UUID().uuidString
        
        let executionTimeNanoseconds = ExecutionTimeDataService.measureMachAbsoluteTime {
            switch settings.keyDerivationAlgorithm.value {
            case .PBKDF2sha256:
                _ = PBKDF2sha256(testPassword, testSalt, testIterations)
            case .PBKDF2sha512:
                _ = PBKDF2sha512(testPassword, testSalt, testIterations)
            }
        }
        
        let executionTimePerIterationNanoseconds = executionTimeNanoseconds / UInt64(testIterations)
        
        guard executionTimePerIterationNanoseconds != 0 else {
            return nil
        }
        
        let nanosecondsAllowed = UInt64(UInt32.random(in: settings.iterationMilliseconds.value)) * 1_000_000
        let iterations = UInt32(min(UInt64(UInt32.max), nanosecondsAllowed / executionTimePerIterationNanoseconds))
        
        return max(KeyDerivationSettings.minimumIterations, iterations)
    }
    
    private static func PBKDF2sha256(_ password: String, _ salt: Data, _ iterations: UInt32) -> SymmetricKey? {
        var key = Data(repeating: 0, count: kCCKeySizeAES256)
        
        let result = key.withUnsafeMutableBytes { keyBytes in
            salt.withUnsafeBytes { saltBytes in
                CCKeyDerivationPBKDF(
                    CCPBKDFAlgorithm(kCCPBKDF2),
                    password,
                    password.utf8.count,
                    saltBytes.baseAddress?.assumingMemoryBound(to: UInt8.self),
                    salt.count,
                    CCPseudoRandomAlgorithm(kCCPRFHmacAlgSHA256),
                    iterations,
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
    
    private static func PBKDF2sha512(_ password: String, _ salt: Data, _ iterations: UInt32) -> SymmetricKey? {
        var key = [UInt8](repeating: 0, count: kCCKeySizeAES256)
        
        let result = key.withUnsafeMutableBytes { keyBytes in
            salt.withUnsafeBytes { saltBytes in
                CCKeyDerivationPBKDF(
                    CCPBKDFAlgorithm(kCCPBKDF2),
                    password,
                    password.utf8.count,
                    saltBytes.baseAddress?.assumingMemoryBound(to: UInt8.self),
                    salt.count,
                    CCPseudoRandomAlgorithm(kCCPRFHmacAlgSHA512),
                    iterations,
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
