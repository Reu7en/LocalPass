//
//  EntityErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 26/02/2025.
//

import Foundation

protocol EntityErrorBase: ErrorBase {
    var type: any EntityBase.Type { get }
    var id: UUID { get }
}
