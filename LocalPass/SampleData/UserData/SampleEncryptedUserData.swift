//
//  SampleEncryptedUserData.swift
//  LocalPass
//
//  Created by Reuben on 24/07/2024.
//

import Foundation

struct SampleEncryptedUserData {
    static var sampleEncryptedUserData: EncryptedUserData {
        let bin = withUnsafeBytes(of: UUID()) { Data($0) }
        let keyMetaData = sampleKeyMetaData
        let encryptionMetaData = sampleEncryptionMetaData
        
        return EncryptedUserData(bin: bin, keyMetaData: keyMetaData, encryptionMetaData: encryptionMetaData)
    }
    
    static var sampleKeyMetaData: KeyMetaData {
        let salt = withUnsafeBytes(of: UUID()) { Data($0) }
        let iterations = UInt32(12345678)
        let keyDerivationAlgorithm = KeyDerivationAlgorithm.PBKDF2sha512
        
        return KeyMetaData(salt: salt, iterations: iterations, keyDerivationAlgorithm: keyDerivationAlgorithm)
    }
    
    static var sampleEncryptionMetaData: EncryptionMetaData {
        let encryptionAlgorithm = EncryptionAlgorithm.AESGCM
        let round = 1
        
        return EncryptionMetaData(encryptionAlgorithm: encryptionAlgorithm, round: round)
    }
}
