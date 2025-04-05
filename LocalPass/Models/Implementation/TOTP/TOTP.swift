//
//  TOTP.swift
//  LocalPass
//
//  Created by Reuben on 27/02/2025.
//

import Foundation

class TOTP: EntityBase {
    private(set) var name: EntityName?
    private(set) var starred: Starred
    private(set) var notes: [EntityNote]?
    private(set) var secret: OTPSecret
    private(set) var algorithm: OTPAlgorithm
    private(set) var timeInterval: OTPTimeInterval
    private(set) var outputLength: OTPOutputLength
    
    let id: UUID
    
    init(
        name: EntityName? = nil,
        starred: Starred = Starred(),
        notes: [EntityNote]? = nil,
        secret: OTPSecret,
        algorithm: OTPAlgorithm = OTPAlgorithm.defaultAlgorithm,
        timeInterval: OTPTimeInterval = OTPTimeInterval(),
        outputLength: OTPOutputLength = OTPOutputLength()
    ) throws {
        self.name = name
        self.starred = starred
        self.notes = notes
        self.secret = secret
        self.algorithm = algorithm
        self.timeInterval = timeInterval
        self.outputLength = outputLength
        
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
            try self.secret.validate()
        } catch _ as OTPSecretShorterThanRecommended {
            // Valid
        } catch {
            errors.append(error)
        }
        
        do {
            try self.outputLength.validate()
        } catch {
            errors.append(error)
        }
        
        try self.throwIfNeeded(TOTPValidationError.self, errors, id: self.id)
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
    
    func changeSecret(to secret: OTPSecret) throws {
        do {
            try secret.validate()
        } catch _ as OTPSecretShorterThanRecommended {
            // Valid
        } catch {
            throw error
        }
        
        self.secret = secret
    }
    
    func changeAlgorithm(to algorithm: OTPAlgorithm) {
        self.algorithm = algorithm
    }
    
    func changeTimeInterval(to timeInterval: OTPTimeInterval) throws {
        try timeInterval.validate()
        
        self.timeInterval = timeInterval
    }
    
    func changeOutputLength(to outputLength: OTPOutputLength) throws {
        try outputLength.validate()
        
        self.outputLength = outputLength
    }
}
