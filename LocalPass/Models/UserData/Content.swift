//
//  Content.swift
//  LocalPass
//
//  Created by Reuben on 21/07/2024.
//

import Foundation

protocol Content: Identifiable, Equatable, Codable {
    var name: String? { get set }
    var starred: Bool { get set }
    var updatedDate: Date? { get set }
    var markedForDeletionDate: Date? { get set }
    
    var creationDate: Date { get }
    var id: UUID { get }
}

extension Content {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
