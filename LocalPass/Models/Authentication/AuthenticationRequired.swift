//
//  AuthenticationRequired.swift
//  LocalPass
//
//  Created by Reuben on 19/08/2024.
//

import Foundation

enum AuthenticationRequired: CaseIterable, Codable {
    case None
    case Minimum
    case Password
    case Maximum
}
