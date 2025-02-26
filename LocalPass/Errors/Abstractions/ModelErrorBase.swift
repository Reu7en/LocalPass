//
//  ModelErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 26/02/2025.
//

import Foundation

protocol ModelErrorBase: ErrorBase {
    var type: any ModelBase.Type { get }
}
