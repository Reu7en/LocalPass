//
//  TOTPErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 09/03/2025.
//

import Foundation

protocol TOTPErrorBase: EntityErrorBase {}

extension TOTPErrorBase {
    var type: any EntityBase.Type {
        return TOTP.self
    }
}
