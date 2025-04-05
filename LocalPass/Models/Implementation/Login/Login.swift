//
//  Login.swift
//  LocalPass
//
//  Created by Reuben on 09/03/2025.
//

import Foundation

class Login: EntityBase {
    private(set) var name: EntityName?
    private(set) var starred: Starred
    private(set) var notes: [EntityNote]?
    private(set) var username: Username?
    private(set) var password: Password?
    private(set) var links: [Link]?
    private(set) var totp: TOTP?
    private(set) var backupCodes: [BackupCode]?
    
    let id: UUID
    
    init (
        name: EntityName? = nil,
        starred: Starred = Starred(),
        notes: [EntityNote]? = nil,
        username: Username? = nil,
        password: Password? = nil,
        links: [Link]? = nil,
        totp: TOTP? = nil,
        backupCodes: [BackupCode]? = nil
    ) throws {
        self.name = name
        self.starred = starred
        self.notes = notes
        self.username = username
        self.password = password
        self.links = links
        self.totp = totp
        self.backupCodes = backupCodes
        
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
        
        do {
            try self.username?.validate()
        } catch {
            errors.append(error)
        }
        
        do {
            try self.password?.validate()
        } catch _ as PasswordShorterThanRecommended {
            // Valid
        } catch {
            errors.append(error)
        }
        
        for link in self.links ?? [] {
            do {
                try link.validate()
            } catch {
                errors.append(error)
            }
        }
        
        for backupCode in self.backupCodes ?? [] {
            do {
                try backupCode.validate()
            } catch {
                errors.append(error)
            }
        }
        
        try self.throwIfNeeded(LoginValidationError.self, errors, id: self.id)
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
    
    func changeUsername(to username: Username?) throws {
        try username?.validate()
        
        self.username = username
    }
    
    func changePassword(to password: Password?) throws {
        try password?.validate()
        
        self.password = password
    }
    
    func changeLinks(to links: [Link]?) throws {
         var errors: [any Error] = []
         
         for link in links ?? [] {
             do {
                 try link.validate()
             } catch {
                 errors.append(error)
             }
         }
         
         try self.throwIfNeeded(errors)
         
         self.links = links
     }
    
    func changeBackupCodes(to backupCodes: [BackupCode]?) throws {
        var errors: [any Error] = []
        
        for backupCode in backupCodes ?? [] {
            do {
                try backupCode.validate()
            } catch {
                errors.append(error)
            }
        }
        
        try self.throwIfNeeded(errors)
        
        self.backupCodes = backupCodes
    }
}
