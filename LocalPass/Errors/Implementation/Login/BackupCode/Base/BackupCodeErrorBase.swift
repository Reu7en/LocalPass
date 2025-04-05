//
//  BackupCodeErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 05/04/2025.
//

import Foundation

protocol BackupCodeErrorBase: AttributeErrorBase {
    associatedtype Attribute = BackupCode
    
    var value: BackupCode.Value { get }
}

extension BackupCodeErrorBase {
    var type: any AttributeBase.Type {
        return BackupCode.self
    }
}
