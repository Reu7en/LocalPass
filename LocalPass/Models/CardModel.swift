//
//  CardModel.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct Card: Identifiable, Equatable, Codable {
    var name: String?
    var holder: String?
    var number: String?
    var expirationMonth: ClosedRange<Int>?
    var expirationYear: Range<Int>?
    var securityCode: Int?
    var notes: [String]?
    let creationDate: Date
    var updatedDate: Date?
    var markedForDeletionDate: Date?
    var starred: Bool
    var showInAutofill: Bool
    let id: UUID
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.id == rhs.id
    }
    
    init(
        name: String? = nil,
        holder: String? = nil,
        number: String? = nil,
        expirationMonth: ClosedRange<Int>? = 0...12,
        expirationYear: Range<Int>? = nil,
        securityCode: Int? = nil,
        notes: [String]? = nil,
        creationDate: Date = Date(),
        updatedDate: Date? = nil,
        markedForDeletionDate: Date? = nil,
        starred: Bool = false,
        showInAutofill: Bool = false,
        id: UUID = UUID()
    ) {
        self.name = name
        self.holder = holder
        self.number = number
        self.expirationMonth = expirationMonth
        self.expirationYear = expirationYear
        self.securityCode = securityCode
        self.notes = notes
        self.creationDate = creationDate
        self.updatedDate = updatedDate
        self.markedForDeletionDate = markedForDeletionDate
        self.starred = starred
        self.showInAutofill = showInAutofill
        self.id = id
    }
}
