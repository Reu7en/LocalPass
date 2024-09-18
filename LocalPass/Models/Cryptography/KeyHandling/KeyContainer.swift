//
//  KeyContainer.swift
//  LocalPass
//
//  Created by Reuben on 19/08/2024.
//

import Foundation
import CryptoKit

struct KeyContainer {
    let key: SymmetricKey?
    let keyMetaData: KeyMetaData
    let encryptionMetaData: EncryptionMetaData
    
    init(
        key: SymmetricKey? = nil,
        keyMetaData: KeyMetaData,
        encryptionMetaData: EncryptionMetaData
    ) {
        self.key = key
        self.keyMetaData = keyMetaData
        self.encryptionMetaData = encryptionMetaData
    }
}
