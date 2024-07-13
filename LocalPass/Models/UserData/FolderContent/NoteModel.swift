//
//  NoteModel.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct Note: FolderContent {
    var title: String?
    var bodies: [String]?
    let creationDate: Date
    var markedForDeletionDate: Date?
    var starred: Bool
    
    var updatedDate: Date?
    let id: UUID
    
    init(
        title: String? = nil,
        bodies: [String]? = nil
    ) {
        self.title = title
        self.bodies = bodies
        self.updatedDate = nil
        self.markedForDeletionDate = nil
        self.starred = false
        
        self.creationDate = Date()
        self.id = UUID()
    }
}
