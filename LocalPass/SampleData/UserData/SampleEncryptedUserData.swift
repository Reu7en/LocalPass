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
        let salt = withUnsafeBytes(of: UUID()) { Data($0) }
        let iterations = UInt32(12345678)
        let keyDerivationAlgorithm = KeyDerivationAlgorithm.PBKDF2sha512
        let id = UUID()
        
        return EncryptedUserData(bin: bin, salt: salt, iterations: iterations, keyDerivationAlgorithm: keyDerivationAlgorithm, id: id)
    }
}
