//
//  EncryptedUserDataModel.swift
//  LocalPass
//
//  Created by Reuben on 23/07/2024.
//

import Foundation

struct EncryptedUserData: Identifiable, Codable {
    let bin: Data
    let salt: Data
    let iterations: UInt32
    let keyDerivationAlgorithm: KeyDerivationAlgorithm
    let id: UUID
    
    init(
        bin: Data,
        salt: Data,
        iterations: UInt32,
        keyDerivationAlgorithm: KeyDerivationAlgorithm,
        id: UUID
    ) {
        self.bin = bin
        self.salt = salt
        self.iterations = iterations
        self.keyDerivationAlgorithm = keyDerivationAlgorithm
        self.id = id
    }
}
