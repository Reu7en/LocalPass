//
//  ValidatableModelErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 26/02/2025.
//

import Foundation

protocol ValidatableModelErrorBase: ErrorBase {
    var type: any ValidatableModelBase.Type { get }
}
