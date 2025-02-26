//
//  Validatable.swift
//  LocalPass
//
//  Created by Reuben on 23/02/2025.
//

import Foundation

protocol Validatable {
    var isValid: Bool { get }
    
    func validate() throws
}

extension Validatable {
    var isValid: Bool {
        return (try? validate()) != nil
    }
    
    func throwIfNeeded(_ errors: [any Error], message: String? = nil) throws {
        if errors.isEmpty {
            return
        }
        
        if errors.count == 1, let error = errors.first {
            throw error
        }
        
        throw AggregateError(values: errors, message: message)
    }
    
    func throwIfNeeded(_ outer: any EntityValidationErrorBase.Type, _ errors: [any Error], id: UUID, message: String? = nil) throws {
        if errors.isEmpty {
            return
        }
        
        do {
            try self.throwIfNeeded(errors, message: message)
        } catch {
            throw self.createOuterError(outer, id, message, inner: error)
        }
    }
 
    private func createOuterError<T: EntityValidationErrorBase>(_ type: T.Type, _ id: UUID, _ message: String? = nil, inner: Error? = nil) -> T {
        return T(id: id, message: message, inner: inner)
    }
}
