//
//  NoteModel.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct Note: FolderContent {
    var name: String?
    var bodies: [String]?
    var updatedDate: Date?
    var markedForDeletionDate: Date?
    var starred: Bool
    
    let creationDate: Date
    let id: UUID
    
    init(
        name: String? = nil,
        bodies: [String]? = nil
    ) {
        self.name = name
        self.bodies = bodies
        self.updatedDate = nil
        self.markedForDeletionDate = nil
        self.starred = false
        
        self.creationDate = Date()
        self.id = UUID()
    }
}
