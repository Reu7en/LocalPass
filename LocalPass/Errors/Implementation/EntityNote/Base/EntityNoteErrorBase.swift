//
//  EntityNoteErrorBase.swift
//  LocalPass
//
//  Created by Reuben on 05/04/2025.
//

import Foundation

protocol EntityNoteErrorBase: AttributeErrorBase {
    associatedtype Attribute = EntityNote
    
    var value: EntityNote.Value { get }
}

extension EntityNoteErrorBase {
    var type: any AttributeBase.Type {
        return EntityNote.self
    }
}
