//
//  Account.swift
//  LocalPass
//
//  Created by Reuben on 26/02/2025.
//

import Foundation

class Account: EntityBase {
    var name: EntityName?
    var starred: Starred
    let id: UUID
    
    init(name: EntityName? = nil, starred: Starred = Starred()) throws {
        self.name = name
        self.starred = starred
        self.id = UUID()
    }
    
    func validate() throws {
        
    }
}
