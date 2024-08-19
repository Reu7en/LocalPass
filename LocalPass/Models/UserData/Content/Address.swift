//
//  Address.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct Address: Content {
    var name: String?
    var address1: String?
    var address2: String?
    var city: String?
    var state: String?
    var zip: String?
    var country: String?
    var updatedDate: Date?
    var markedForDeletionDate: Date?
    var starred: Bool
    var showInAutofill: Bool
    
    let creationDate: Date
    let id: UUID
    
    init(
        name: String? = nil,
        address1: String? = nil,
        address2: String? = nil,
        city: String? = nil,
        state: String? = nil,
        zip: String? = nil,
        country: String? = nil,
        showInAutofill: Bool = false
    ) {
        self.name = name
        self.address1 = address1
        self.address2 = address2
        self.city = city
        self.state = state
        self.zip = zip
        self.country = country
        self.updatedDate = nil
        self.markedForDeletionDate = nil
        self.starred = false
        self.showInAutofill = showInAutofill
        
        self.creationDate = Date()
        self.id = UUID()
    }
}
