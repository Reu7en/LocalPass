//
//  OTPSecretErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 03/03/2025.
//

import Foundation

protocol OTPSecretErrorBase: AttributeErrorBase {
    associatedtype Attribute = OTPSecret
    
    var value: OTPSecret.Value { get }
}

extension OTPSecretErrorBase {
    var type: any AttributeBase.Type {
        return OTPSecret.self
    }
}
