//
//  LoginErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 09/03/2025.
//

import Foundation

protocol LoginErrorBase: EntityErrorBase {}

extension LoginErrorBase {
    var type: any EntityBase.Type {
        return Login.self
    }
}
