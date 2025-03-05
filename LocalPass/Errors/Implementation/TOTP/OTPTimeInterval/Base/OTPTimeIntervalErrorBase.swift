//
//  OTPTimeIntervalErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 04/03/2025.
//

import Foundation

protocol OTPTimeIntervalErrorBase: AttributeErrorBase {
    associatedtype Attribute = OTPTimeInterval
    
    var value: OTPTimeInterval.Value { get }
}

extension OTPTimeIntervalErrorBase {
    var type: any AttributeBase.Type {
        return OTPTimeInterval.self
    }
}
