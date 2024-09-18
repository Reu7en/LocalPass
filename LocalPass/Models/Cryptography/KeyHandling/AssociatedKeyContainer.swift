//
//  AssociatedKeyContainer.swift
//  LocalPass
//
//  Created by Reuben on 19/08/2024.
//

import Foundation
import CryptoKit

struct AssociatedKeyContainer {
    let keyContainer: KeyContainer
    let keychainTag: String
    
    init(
        keyContainer: KeyContainer,
        keychainTag: String
    ) {
        let nilKeyContainer = KeyContainer(keyMetaData: keyContainer.keyMetaData, encryptionMetaData: keyContainer.encryptionMetaData)
        
        self.keyContainer = nilKeyContainer
        self.keychainTag = keychainTag
    }
}
