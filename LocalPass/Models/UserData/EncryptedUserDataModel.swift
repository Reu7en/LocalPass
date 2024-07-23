//
//  EncryptedUserDataModel.swift
//  LocalPass
//
//  Created by Reuben on 23/07/2024.
//

import Foundation

struct EncryptedUserData: Identifiable, Codable {
    let blob: Data
    let salt: Data
    let iterations: UInt32
    let keyDerivationAlgorithm: KeyDerivationAlgorithm
    let id: UUID
    
    init(
        blob: Data,
        salt: Data,
        iterations: UInt32,
        keyDerivationAlgorithm: KeyDerivationAlgorithm,
        id: UUID
    ) {
        self.blob = blob
        self.salt = salt
        self.iterations = iterations
        self.keyDerivationAlgorithm = keyDerivationAlgorithm
        self.id = id
    }
}
