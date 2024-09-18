//
//  EncryptionDataService.swift
//  LocalPass
//
//  Created by Reuben on 04/08/2024.
//

import Foundation
import CryptoKit

struct EncryptionDataService {
    func encrypt(_ userData: UserData, with keyContainers: [KeyContainer], using encryptionSettings: EncryptionSettings) -> EncryptedUserData? {
        if encryptionSettings.numberOfRounds.value < 1 || encryptionSettings.encryptionAlgorithms.value.isEmpty { return nil }
        
        guard var bin = JSONSerialisationDataService.userDataToJSON(userData) else { return nil }
        
        for round in 0..<encryptionSettings.numberOfRounds.value {
            for encryptionAlgorithm in encryptionSettings.encryptionAlgorithms.value {
                guard let keyContainer = keyContainers.first(where: { $0.encryptionMetaData.round == round && $0.encryptionMetaData.encryptionAlgorithm == encryptionAlgorithm }) else { return nil }
                guard let key = keyContainer.key else { return nil }
                
                switch encryptionAlgorithm {
                case .AESGCM:
                    guard let sealedBox = AESGCMDataService.encrypt(bin, using: key) else { return nil }
                    let encryptedUserData = EncryptedUserData(bin: sealedBox, keyMetaData: keyContainer.keyMetaData, encryptionMetaData: keyContainer.encryptionMetaData)
                    guard let encryptedBin = JSONSerialisationDataService.encryptedUserDataToJSON(encryptedUserData) else { return nil }
                    
                    bin = encryptedBin
                case .ChaCha20Poly1305:
                    guard let sealedBox = ChaCha20Poly1305DataService.encrypt(bin, using: key) else { return nil }
                    let encryptedUserData = EncryptedUserData(bin: sealedBox, keyMetaData: keyContainer.keyMetaData, encryptionMetaData: keyContainer.encryptionMetaData)
                    guard let encryptedBin = JSONSerialisationDataService.encryptedUserDataToJSON(encryptedUserData) else { return nil }
                    
                    bin = encryptedBin
                }
            }
        }
        
        return JSONSerialisationDataService.JSONToEncryptedUserData(bin)
    }
    
    func decrypt(_ encryptedUserData: EncryptedUserData, with password: String) -> DecryptContainer? {
        guard var bin = JSONSerialisationDataService.encryptedUserDataToJSON(encryptedUserData) else { return nil }
        
        var x = 0
        var keyContainers: [AssociatedKeyContainer] = []
        
        while x < EncryptionSettings.maxDepth {
            if let encryptedUserData = JSONSerialisationDataService.JSONToEncryptedUserData(bin) {
                guard let key = KeyDerivationDataService.deriveKey(from: password, salt: encryptedUserData.keyMetaData.salt, iterations: encryptedUserData.keyMetaData.iterations, with: encryptedUserData.keyMetaData.keyDerivationAlgorithm) else { return nil }
                
                keyContainers.append(AssociatedKeyContainer(keyContainer: KeyContainer(keyMetaData: encryptedUserData.keyMetaData, encryptionMetaData: encryptedUserData.encryptionMetaData), keychainTag: UUID().uuidString))
                
                switch encryptedUserData.encryptionMetaData.encryptionAlgorithm {
                case .AESGCM:
                    guard let openedBox = AESGCMDataService.decrypt(bin, using: key) else { return nil }
                    bin = openedBox
                case .ChaCha20Poly1305:
                    guard let openedBox = ChaCha20Poly1305DataService.decrypt(bin, using: key) else { return nil }
                    bin = openedBox
                }
            } else if let userData = JSONSerialisationDataService.JSONToUserData(bin) {
                return DecryptContainer(userData: userData, keys: keyContainers)
            } else {
                return nil
            }
            
            x += 1
        }
        
        return nil
    }
}
