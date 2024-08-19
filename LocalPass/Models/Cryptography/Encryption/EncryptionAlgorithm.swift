//
//  EncryptionAlgorithm.swift
//  LocalPass
//
//  Created by Reuben on 19/08/2024.
//

import Foundation

enum EncryptionAlgorithm: CaseIterable, Codable {
    case AESGCM
    case ChaCha20Poly1305
}
