//
//  EncryptedUserData.swift
//  LocalPass
//
//  Created by Reuben on 23/07/2024.
//

import Foundation

struct EncryptedUserData: Identifiable, Codable {
    let bin: Data
    let keyMetaData: KeyMetaData
    let encryptionMetaData: EncryptionMetaData
    let id: UUID
    
    init(
        bin: Data,
        keyMetaData: KeyMetaData,
        encryptionMetaData: EncryptionMetaData
    ) {
        self.bin = bin
        self.keyMetaData = keyMetaData
        self.encryptionMetaData = encryptionMetaData
        
        self.id = UUID()
    }
}
