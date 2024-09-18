//
//  EncryptionMetaData.swift
//  LocalPass
//
//  Created by Reuben on 19/08/2024.
//

import Foundation

struct EncryptionMetaData: Codable {
    let encryptionAlgorithm: EncryptionAlgorithm
    let round: Int
    
    init(
        encryptionAlgorithm: EncryptionAlgorithm,
        round: Int
    ) {
        self.encryptionAlgorithm = encryptionAlgorithm
        self.round = round
    }
}
