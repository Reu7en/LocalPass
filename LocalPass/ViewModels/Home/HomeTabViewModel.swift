//
//  HomeTabViewModel.swift
//  LocalPass
//
//  Created by Reuben on 30/09/2024.
//

import Foundation
import SwiftUI

class HomeTabViewModel: ObservableObject {
    // View properties
    @Published private(set) var showAccounts: Bool
    @Published private(set) var showNotes: Bool
    @Published private(set) var showCards: Bool
    @Published private(set) var showIdentities: Bool
    @Published private(set) var showLabels: Bool
    @Published private(set) var primaryColor: Color
    @Published private(set) var accentColor: Color
    
    var accountsLabel: String {
        self.showLabels ? "Accounts" : ""
    }
    
    var notesLabel: String {
        self.showLabels ? "Notes" : ""
    }
    
    var cardsLabel: String {
        self.showLabels ? "Cards" : ""
    }
    
    var identitiesLabel: String {
        self.showLabels ? "Identities" : ""
    }
    
    var settingsLabel: String {
        self.showLabels ? "Settings" : ""
    }
    
    var debugLabel: String {
        self.showLabels ? "Debug" : ""
    }
    
    var accountsSystemImageName: String {
        return self.calculateAccountsSystemImageName()
    }
    
    let notesSystemImageName: String = "note.text"
    let cardsSystemImageName: String = "creditcard"
    let identitiesSystemImageName: String = "person.text.rectangle"
    let settingsSystemImageName: String = "gear"
    let debugSystemImageName: String = "ladybug"
    
    // Child view properties
    @Published private(set) var accounts: Folder<Account>?
    @Published private(set) var notes: Folder<Note>?
    @Published private(set) var cards: Folder<Card>?
    @Published private(set) var identities: Folder<Identity>?
    @Published private(set) var userSettings: UserSettings
    @Published private(set) var theme: Theme
    
    init(
        userData: UserData,
        homeTabViewSettings: HomeTabViewSettings,
        theme: Theme
    ) {
        self.showAccounts = homeTabViewSettings.showAccounts.value
        self.showNotes = homeTabViewSettings.showNotes.value
        self.showCards = homeTabViewSettings.showCards.value
        self.showIdentities = homeTabViewSettings.showIdentities.value
        self.showLabels = homeTabViewSettings.showLabels.value
        self.primaryColor = theme.primaryColor.color
        self.accentColor = theme.accentColor.color
       
        self.accounts = userData.accounts
        self.notes = userData.notes
        self.cards = userData.cards
        self.identities = userData.identities
        self.userSettings = userData.userSettings
        self.theme = theme
    }
    
    private func calculateAccountsSystemImageName() -> String {
        switch DeviceInformationDataService.getDeviceType() {
        case .iPhone:
            return "lock.iphone"
        case .iPad:
            return "lock.ipad"
        case .iMac:
            return "lock.desktopcomputer"
        case .MacBook:
            return "lock.laptopcomputer"
        case .MacDesktop:
            return "lock.display"
        case .Vision:
            return "opticid"
        case .Unknown:
            return "lock.ipad"
        }
    }
}
