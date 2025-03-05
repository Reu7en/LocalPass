//
//  TOTP.swift
//  LocalPass
//
//  Created by Reuben on 27/02/2025.
//

import Foundation

class TOTP: EntityBase {
    private(set) var name: EntityName?
    private(set) var secret: OTPSecret
    private(set) var algorithm: OTPAlgorithm
    private(set) var timeInterval: OTPTimeInterval
    private(set) var outputLength: OTPOutputLength
    private(set) var starred: Starred
    
    let id: UUID
    
    init(name: EntityName? = nil, secret: OTPSecret, algorithm: OTPAlgorithm = OTPAlgorithm.defaultAlgorithm, timeInterval: OTPTimeInterval = OTPTimeInterval(), outputLength: OTPOutputLength = OTPOutputLength(), starred: Starred = Starred()) throws {
        self.name = name
        self.secret = secret
        self.algorithm = algorithm
        self.timeInterval = timeInterval
        self.outputLength = outputLength
        self.starred = starred
        
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
        
        try self.throwIfNeeded(errors)
    }
    
    func changeName(to name: EntityName) throws {
        try name.validate()
        
        self.name = name
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
    
    func changeStarred(to starred: Starred) {
        self.starred = starred
    }
}
