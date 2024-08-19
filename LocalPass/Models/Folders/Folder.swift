//
//  Folder.swift
//  LocalPass
//
//  Created by Reuben on 09/07/2024.
//

import Foundation

struct Folder<T: FolderContent>: FolderContent {
    var name: String?
    var contents: [FolderContentType<T>]?
    var starred: Bool
    var updatedDate: Date?
    var markedForDeletionDate: Date?
    
    let creationDate: Date
    let id: UUID
    
    init(
        name: String?,
        contents: [FolderContentType<T>]?
    ) {
        self.name = name
        self.contents = contents
        self.starred = false
        self.updatedDate = nil
        self.markedForDeletionDate = nil
        
        self.creationDate = Date()
        self.id = UUID()
    }
}
