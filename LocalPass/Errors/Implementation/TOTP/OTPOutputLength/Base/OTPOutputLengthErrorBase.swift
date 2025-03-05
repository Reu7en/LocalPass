//
//  OTPOutputLengthErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 04/03/2025.
//

import Foundation

protocol OTPOutputLengthErrorBase: AttributeErrorBase {
    associatedtype Attribute = OTPOutputLength
    
    var value: OTPOutputLength.Value { get }
}

extension OTPOutputLengthErrorBase {
    var type: any AttributeBase.Type {
        return OTPOutputLength.self
    }
}
