//
//  FolderContentModel.swift
//  LocalPass
//
//  Created by Reuben on 11/07/2024.
//

import Foundation

protocol FolderContent: Identifiable, Equatable, Codable {
    var starred: Bool { get set }
    var updatedDate: Date? { get set }
    var markedForDeletionDate: Date? { get set }
    
    var creationDate: Date { get }
    var id: UUID { get }
}

extension FolderContent {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
