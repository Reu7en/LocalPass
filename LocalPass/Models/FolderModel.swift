//
//  FolderModel.swift
//  LocalPass
//
//  Created by Reuben on 09/07/2024.
//

import Foundation

class Folder<T: FolderContent>: Identifiable, Equatable, Codable {
    var name: String?
    var contents: [T]?
    var children: [Folder<T>]?
    let creationDate: Date
    var updatedDate: Date?
    var markedForDeletionDate: Date?
    var starred: Bool
    let id: UUID
    
    static func == (lhs: Folder<T>, rhs: Folder<T>) -> Bool {
        lhs.id == rhs.id
    }
    
    init(
        name: String? = nil,
        contents: [T]? = nil,
        children: [Folder<T>]? = nil,
        creationDate: Date = Date(),
        updatedDate: Date? = nil,
        markedForDeletionDate: Date? = nil,
        starred: Bool = false,
        id: UUID = UUID()
    ) {
        self.name = name
        self.contents = contents
        self.children = children
        self.creationDate = creationDate
        self.updatedDate = updatedDate
        self.markedForDeletionDate = markedForDeletionDate
        self.starred = starred
        self.id = id
    }
}

protocol FolderContent: Identifiable, Codable {
    var id: UUID { get }
}

extension Login: FolderContent {}
extension Account: FolderContent {}
extension Note: FolderContent {}
extension Card: FolderContent {}
extension Identity: FolderContent {}
extension Document: FolderContent {}
extension Address: FolderContent {}
