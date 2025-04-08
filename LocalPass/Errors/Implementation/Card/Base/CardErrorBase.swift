//
//  CardErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 06/04/2025.
//

import Foundation

protocol CardErrorBase: EntityErrorBase {}

extension CardErrorBase {
    var type: any EntityBase.Type {
        return Card.self
    }
}
