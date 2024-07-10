//
//  NoteModel.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct Note: Identifiable, Equatable, Codable {
    var title: String?
    var bodies: [String]?
    let creationDate: Date
    var updatedDate: Date?
    var markedForDeletionDate: Date?
    var starred: Bool
    let id: UUID
    
    static func == (lhs: Note, rhs: Note) -> Bool {
        lhs.id == rhs.id
    }
    
    init(
        title: String? = nil,
        bodies: [String]? = nil,
        creationDate: Date = Date(),
        updatedDate: Date? = nil,
        markedForDeletionDate: Date? = nil,
        starred: Bool = false,
        id: UUID = UUID()
    ) {
        self.title = title
        self.bodies = bodies
        self.creationDate = creationDate
        self.updatedDate = updatedDate
        self.markedForDeletionDate = markedForDeletionDate
        self.starred = starred
        self.id = id
    }
}
