//
//  Login.swift
//  LocalPass
//
//  Created by Reuben on 26/02/2025.
//

import Foundation

class Login: EntityBase {
    private(set) var name: EntityName?
    private(set) var username: Username?
    private(set) var password: Password?
    private(set) var urls: [Url]?
    private(set) var totp: TOTP?
    private(set) var starred: Starred
    
    let id: UUID
    
    init(name: EntityName? = nil, username: Username? = nil, password: Password? = nil, urls: [Url]? = nil, totp: TOTP? = nil, starred: Starred = Starred()) throws {
        self.name = name
        self.username = username
        self.password = password
        self.urls = urls
        self.totp = totp
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
            try self.username?.validate()
        } catch {
            errors.append(error)
        }
        
        do {
            try self.password?.validate()
        } catch {
            errors.append(error)
        }
        
        for url in self.urls ?? [] {
            do {
                try url.validate()
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
    
    func changeUsername(to username: Username?) throws {
        try username?.validate()
        
        self.username = username
    }
    
    func changePassword(to password: Password?) throws {
        try password?.validate()
        
        self.password = password
    }
    
    func changeUrls(to urls: [Url]?) throws {
        var errors: [any Error] = []
        
        for url in urls ?? [] {
            do {
                try url.validate()
            } catch {
                errors.append(error)
            }
        }
        
        try self.throwIfNeeded(errors)
        
        self.urls = urls
    }
    
    func addUrl(_ url: Url) throws {
        try url.validate()
        
        self.urls?.append(url)
    }
    
    func insertUrl(_ newUrl: Url, at index: Int) throws {
        
    }
    
    func insertUrl(_ newUrl: Url, before url: Url) throws {
        
    }
    
    func insertUrl(_ newUrl: Url, after url: Url) throws {
        
    }
    
    func changeUrl(from oldUrl: Url, to newUrl: Url) throws {
        
    }
    
    func removeUrl(_ url: Url) throws {
        
    }
    
    func removeUrl(at index: Int) throws {
        
    }
    
    func moveUrl(_ newUrl: Url, at index: Int) throws {
        
    }
    
    func moveUrl(_ newUrl: Url, before url: Url) throws {
        
    }
    
    func moveUrl(_ newUrl: Url, after url: Url) throws {
        
    }
    
    func changeStarred(to starred: Starred) {
        self.starred = starred
    }
}

struct Username: AttributeBase {
    let value: String
    
    init(_ value: String) throws {
        self.value = value
        
        try self.validate()
    }
    
    func validate() throws {
        
    }
}

struct Password: AttributeBase {
    let value: String
    
    init(_ value: String) throws {
        self.value = value
        
        try self.validate()
    }
    
    func validate() throws {
        
    }
}

struct Url: AttributeBase {
    let value: URL
    
    init(_ value: URL) throws {
        self.value = value
    }
    
    func validate() throws {
        
    }
}

struct BackupCode: AttributeBase {
    let value: String
    
    init(_ value: String) throws {
        self.value = value
    }
    
    func validate() throws {
        
    }
}

struct EntityNote: AttributeBase {
    let value: String
    
    init(_ value: String) throws {
        self.value = value
    }
    
    func validate() throws {
        
    }
}
