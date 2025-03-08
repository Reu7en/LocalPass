//
//  AccountErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 26/02/2025.
//

import Foundation

protocol AccountErrorBase: EntityErrorBase {}

extension AccountErrorBase {
    var type: any EntityBase.Type {
        return Account.self
    }
}
