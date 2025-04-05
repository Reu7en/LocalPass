//
//  AccountErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 09/03/2025.
//

import Foundation

protocol AccountErrorBase: EntityErrorBase {}

extension AccountErrorBase {
    var type: any EntityBase.Type {
        return Account.self
    }
}
