//
//  EntityBase.swift
//  LocalPass
//
//  Created by Reuben on 23/02/2025.
//

import Foundation

protocol EntityBase: ValidatableModelBase, Identifiable {
    var id: UUID { get }
}

extension EntityBase {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
