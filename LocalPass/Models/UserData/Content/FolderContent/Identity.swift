//
//  Identity.swift
//  LocalPass
//
//  Created by Reuben on 08/07/2024.
//

import Foundation

struct Identity: FolderContent {
    var name: String?
    var title: Title?
    var firstName: String?
    var middleName: String?
    var lastName: String?
    var birthday: Date?
    var usernames: [Username]?
    var emails: [Email]?
    var phoneNumbers: [String]?
    var documents: [Document]?
    var addresses: [Address]?
    var updatedDate: Date?
    var markedForDeletionDate: Date?
    var starred: Bool
    
    let creationDate: Date
    let id: UUID
    
    init(
        name: String? = nil,
        title: Title? = nil,
        firstName: String? = nil,
        middleName: String? = nil,
        lastName: String? = nil,
        birthday: Date? = nil,
        usernames: [Username]? = nil,
        emails: [Email]? = nil,
        phoneNumbers: [String]? = nil,
        documents: [Document]? = nil,
        addresses: [Address]? = nil
    ) {
        self.name = name
        self.title = title
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.birthday = birthday
        self.usernames = usernames
        self.emails = emails
        self.phoneNumbers = phoneNumbers
        self.documents = documents
        self.addresses = addresses
        self.updatedDate = nil
        self.markedForDeletionDate = nil
        self.starred = false
        
        self.creationDate = Date()
        self.id = UUID()
    }
}

enum Title: CaseIterable, Equatable, Codable {
    case Mr
    case Mrs
    case Miss
    case Ms
    case Other(String)
    
    static var allCases: [Title] {
        [.Mr, .Mrs, .Miss, .Ms]
    }
}
