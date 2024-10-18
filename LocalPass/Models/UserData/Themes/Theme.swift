//
//  Theme.swift
//  LocalPass
//
//  Created by Reuben on 24/09/2024.
//

import Foundation
import SwiftUI

struct Theme: Content {
    var name: String?
    var primaryColor: CodableColor
    var secondaryColor: CodableColor
    var accentColor: CodableColor
    var backgroundColor: CodableColor
    var textColor: CodableColor
    var starred: Bool
    var updatedDate: Date?
    var markedForDeletionDate: Date?
    
    let creationDate: Date
    let id: UUID
    
    init(
        name: String? = nil,
        primaryColor: CodableColor,
        secondaryColor: CodableColor,
        accentColor: CodableColor,
        backgroundColor: CodableColor,
        textColor: CodableColor
    ) {
        self.name = name
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.accentColor = accentColor
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.starred = false
        self.updatedDate = nil
        self.markedForDeletionDate = nil
        
        self.creationDate = Date()
        self.id = UUID()
    }
    
    static let defaultThemes = [
        systemTheme,
        lightTheme,
        darkTheme
    ]
    
#if DEBUG
    static let defaultTheme = testTheme
#else
    static let defaultTheme = systemTheme
#endif
    
    private static let testTheme = Theme(
        name: "Test",
        primaryColor: CodableColor(color: .blue),
        secondaryColor: CodableColor(color: .purple),
        accentColor: CodableColor(color: .red),
        backgroundColor: CodableColor(color: .green),
        textColor: CodableColor(color: .primary)
    )
    
    private static let systemTheme = Theme(
        name: "System",
        primaryColor: CodableColor(color: .gray),
        secondaryColor: CodableColor(color: .gray),
        accentColor: CodableColor(color: .accentColor),
        backgroundColor: CodableColor(color: .clear),
        textColor: CodableColor(color: .primary)
    )
    
    private static let lightTheme = Theme(
        name: "Light",
        primaryColor: CodableColor(color: .gray),
        secondaryColor: CodableColor(color: .gray),
        accentColor: CodableColor(color: .accentColor),
        backgroundColor: CodableColor(color: .white),
        textColor: CodableColor(color: .black)
    )
    
    private static let darkTheme = Theme(
        name: "Dark",
        primaryColor: CodableColor(color: .gray),
        secondaryColor: CodableColor(color: .gray),
        accentColor: CodableColor(color: .accentColor),
        backgroundColor: CodableColor(color: .black),
        textColor: CodableColor(color: .white)
    )
}
