//
//  KeyMetaData.swift
//  LocalPass
//
//  Created by Reuben on 19/08/2024.
//

import Foundation

struct KeyMetaData: Codable {
    let salt: Data
    let iterations: UInt32
    let keyDerivationAlgorithm: KeyDerivationAlgorithm
    
    init(
        salt: Data,
        iterations: UInt32,
        keyDerivationAlgorithm: KeyDerivationAlgorithm
    ) {
        self.salt = salt
        self.iterations = iterations
        self.keyDerivationAlgorithm = keyDerivationAlgorithm
    }
}
