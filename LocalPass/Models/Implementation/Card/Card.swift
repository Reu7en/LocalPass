//
//  Card.swift
//  LocalPass
//
//  Created by Reuben on 06/04/2025.
//

import Foundation

class Card: EntityBase {
    private(set) var name: EntityName?
    private(set) var starred: Starred
    private(set) var notes: [EntityNote]?
    private(set) var type: CardType?
    private(set) var holder: CardHolder?
    private(set) var number: CardNumber?
    private(set) var expirationMonth: ExpirationMonth?
    private(set) var expirationYear: ExpirationYear?
    private(set) var securityCode: SecurityCode?
    
    let id: UUID
    
    init(
        name: EntityName? = nil,
        starred: Starred,
        notes: [EntityNote]? = nil,
        type: CardType? = nil,
        holder: CardHolder? = nil,
        number: CardNumber? = nil,
        expirationMonth: ExpirationMonth? = nil,
        expirationYear: ExpirationYear? = nil,
        securityCode: SecurityCode? = nil
    ) throws {
        self.name = name
        self.starred = starred
        self.notes = notes
        self.type = type
        self.holder = holder
        self.number = number
        self.expirationMonth = expirationMonth
        self.expirationYear = expirationYear
        self.securityCode = securityCode
        
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
            try self.holder?.validate()
        } catch {
            errors.append(error)
        }
        
        do {
            try self.number?.validate()
        } catch {
            errors.append(error)
        }
        
        do {
            try self.expirationMonth?.validate()
        } catch {
            errors.append(error)
        }
        
        do {
            try self.expirationYear?.validate()
        } catch {
            errors.append(error)
        }
        
        do {
            try self.securityCode?.validate()
        } catch {
            errors.append(error)
        }
        
        do {
            try self.validateForCardType()
        } catch {
            errors.append(CardInvalidForCardType(id: self.id, inner: error))
        }
        
        try self.throwIfNeeded(CardValidationError.self, errors, id: self.id)
    }
    
    private func validateForCardType() throws {
        guard let type = self.type else { return }
        
        var errors: [any Error] = []
        
        do {
            try self.number?.validate(for: type)
        } catch {
            errors.append(error)
        }
        
        do {
            try self.securityCode?.validate(for: type)
        } catch {
            errors.append(error)
        }
        
        try self.throwIfNeeded(CardInvalidForCardType.self, errors, id: self.id)
    }
}
