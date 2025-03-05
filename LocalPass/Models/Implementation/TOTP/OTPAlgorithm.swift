//
//  OTPAlgorithm.swift
//  LocalPass
//
//  Created by Reuben on 05/03/2025.
//

import Foundation

enum OTPAlgorithm: EnumBase {
    case sha1
    case sha256
    case sha512
    
    static let defaultAlgorithm: OTPAlgorithm = .sha1
}
