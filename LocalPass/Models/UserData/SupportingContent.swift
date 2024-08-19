//
//  SupportingContent.swift
//  LocalPass
//
//  Created by Reuben on 21/07/2024.
//

import Foundation

protocol SupportingContent: Equatable, Codable {
    var updatedDate: Date? { get set }
    var markedForDeletionDate: Date? { get set }
    
    var creationDate: Date { get }
    
    static func == (lhs: Self, rhs: Self) -> Bool
}
