//
//  Account.swift
//  LocalPass
//
//  Created by Reuben on 09/03/2025.
//

import Foundation

class Account: EntityBase {
    private(set) var name: EntityName?
    private(set) var starred: Starred
    private(set) var notes: [EntityNote]?
    private(set) var logins: [Login]?
    
    let id: UUID
    
    init(
        name: EntityName? = nil,
        starred: Starred = Starred(),
        notes: [EntityNote]? = nil,
        logins: [Login]? = nil
    ) throws {
        self.name = name
        self.starred = starred
        self.notes = notes
        self.logins = logins
        
        self.id = UUID()
        
        try self.validate()
    }
    
    func validate() throws {
        var errors: [any Error] = []
        
        do {
            try self.name?.validate()
        } catch {
            errors.append(error)
        }
        
        for note in self.notes ?? [] {
            do {
                try note.validate()
            } catch {
                errors.append(error)
            }
        }
        
        try self.throwIfNeeded(AccountValidationError.self, errors, id: self.id)
    }
    
    func changeName(to name: EntityName?) throws {
        try name?.validate()
        
        self.name = name
    }
    
    func changeStarred(to starred: Starred) {
        self.starred = starred
    }
    
    func changeNotes(to notes: [EntityNote]?) throws {
        var errors: [any Error] = []
        
        for note in notes ?? [] {
            do {
                try note.validate()
            } catch {
                errors.append(error)
            }
        }
        
        try self.throwIfNeeded(errors)
        
        self.notes = notes
    }
    
    func changeLogins(to logins: [Login]?) throws {
        self.logins = logins
    }
}
