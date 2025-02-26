//
//  ErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 25/02/2025.
//

import Foundation

protocol ErrorBase: Error {
    var message: String? { get }
    var inner: (any Error)? { get }
}
